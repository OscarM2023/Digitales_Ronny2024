`include "adder.sv"
`include "alu.sv"
`include "and1.sv"
`include "branch_comp.sv"
`include "control_unit.sv"
`include "forwarding_unit.sv"
`include "hazard_unit.sv"
`include "mux21.sv"
`include "mux41.sv"
`include "PC.sv"
`include "pipe_ex_mem.sv"
`include "pipe_id_ex.sv"
`include "pipe_if_id.sv"
`include "pipe_mem_wb.sv"
`include "registers.sv"
`include "signextend.sv"
`include "XSPRAMLP_2048X32_M8P.sv"
`include "pipeline_top.sv"



module pipeline_top #(
    parameter WIDTH = 32
)(
    input wire RST,
    input wire CLK
);

wire pc_mux_to_pc [WIDTH-1:0];
wire pc_to_inst_mem [WIDTH-1:0];
wire pc_adder_to_pc_mux [WIDTH-1:0];
wire inst_mem_to_inst_pipe [WIDTH-1:0];
wire instruction [WIDTH-1:0];
wire register_1 [WIDTH-1:0];
wire register_2 [WIDTH-1:0];
wire register_1_equals_register_2;
wire pipe_pc_passthrough [WIDTH-1:0];
wire imm_adder_to_pc_mux [WIDTH-1:0];
wire immediate_sexted [WIDTH-1:0];
wire alu_operation [3:0];
wire stall_signal_for_mux;
wire control_signals_to_be_muxed[9:0];
wire control_pcsrc;
wire control_alusrc_to_mux;
wire control_memtoread_to_mux;
wire control_memwrite_to_mux;
wire control_memtoreg_to_mux;
wire control_regwrite_to_mux;
wire and_branch_was_taken;
wire hazard_unit_stall_signal;
wire hazard_unit_pcwrite_signal;

assign control_signals_to_be_muxed = {
    alu_operation,
    control_alusrc_to_mux,
    control_regwrite_to_mux,
    control_memtoreg_to_mux,
    control_memwrite_to_mux,
    control_memtoread_to_mux
};

wire control_signals_from_mux [9:0];

wire mux_aluop_to_id_ex [3:0];
wire mux_alusrc_to_id_ex;
wire mux_memtoread_to_id_ex;
wire mux_memwrite_to_id_ex;
wire mux_memtoreg_to_id_ex;
wire mux_regwrite_to_id_ex;

always_comb begin

    control_signals_from_mux = {
        mux_aluop_to_id_ex,
        mux_alusrc_to_id_ex,
        mux_regwrite_to_id_ex,
        mux_memtoreg_to_id_ex,
        mux_memwrite_to_id_ex,
        mux_memtoread_to_id_ex
    };

end 

wire id_ex_aluop_to_alu [3:0];
wire id_ex_alusrc_to_alusrc_mux;
wire id_ex_memtoread_to_hazards;
wire id_ex_memwrite_to_ex_mem;
wire id_ex_memtoreg_to_ex_mem;
wire id_ex_regwrite_to_ex_mem;

wire id_ex_rs1_to_forward_a_mux [WIDTH-1:0];
wire id_ex_rs2_to_forward_b_mux [WIDTH-1:0];
wire id_ex_a_rs1_to_forwarding [4:0];
wire id_ex_a_rs2_to_forwarding [4:0];
wire id_ex_a_rd_to_ex_mem [4:0];
wire id_ex_imm_sexted_to_alu_src_mux [WIDTH-1:0];

wire forward_a_mux_to_alu_a_in [WIDTH-1:0];
wire forward_b_mux_to_alu_src_mux [WIDTH-1:0];
wire alu_src_mux_to_alu_b_in [WIDTH-1:0];
wire alu_out_to_ex_mem_pipe [WIDTH-1:0];
wire forwarding_forward_a_sel_signal [1:0];
wire forwarding_forward_b_sel_signal [1:0];

wire ex_mem_memwrite_to_data_mem;
wire ex_mem_memtoreg_to_mem_wb;
wire ex_mem_regwrite_to_mem_wb;
wire ex_mem_result_op_to_data_mem [WIDTH-1:0];
wire ex_mem_wr_data_to_data_mem [WIDTH-1:0];
wire ex_mem_a_rd_to_mem_wb [4:0];

wire data_mem_out_to_mem_wb [WIDTH-1:0];
wire mem_wb_memtoreg_to_data_mem_skip_mux;
wire mem_wb_regwrite_to_registers;
wire data_read_to_data_mem_skip_mux [WIDTH-1:0];
wire result_op_to_data_mem_skip_mux [WIDTH-1:0];
wire mem_wb_a_rd_to_registers [4:0];
wire data_mem_skip_mux_out_to_registers [WIDTH-1:0];



mux21 PC_MUX(
    .SEL(and_branch_was_taken),
    .IN0(pc_adder_to_pc_mux),
    .IN1(imm_adder_to_pc_mux),
    .OUT(pc_mux_to_pc)
);

PC PC(
    .clk(clk),
    .rst(rst),
    .STALL(hazard_unit_pcwrite_signal),
    .IN(pc_mux_to_pc),
    .OUT(pc_to_inst_mem)
);

XSPRAMLP_2048X32_M8P INST_MEM(
    .CLK(clk),
    .A(pc_to_inst_mem),
    .Q(inst_mem_to_inst_pipe),
    .WEn(1'b1)//Es activo en bajo

);

adder PC_ADDER(
    .A(pc_to_inst_mem),
    .B(32'h00000004),
    .Q(pc_adder_to_pc_mux)
);

pipe_if_id PIPE_IF_ID(
    .clk(clk),
    .rst(rst),
    .FLUSH(and_branch_was_taken),
    .STALL(hazard_unit_stall_signal),
    .PC_IN(pc_to_inst_mem),
    .INSTRUCTION_IN(inst_mem_to_inst_pipe),
    .PC_OUT(pipe_pc_passthrough),
    .INSTRUCTION_OUT(instruction)
);

registers REGISTERS(
    .clk(clk),
    .rst(rst),
    .REGWRITE(mem_wb_regwrite_to_registers),
    .ADR_REG1(instruction[19:15]),
    .ADR_REG2(instruction[24:20]),
    .ADR_WR_REG(mem_wb_a_rd_to_registers),
    .WR_DATA(data_mem_skip_mux_out_to_registers),
    .REG_DATA1(register_1),
    .REG_DATA2(register_2)
);

branch_comp BRANCH_COMPARE(
    .IN1(register_1),
    .IN2(register_2),
    .OUT(register_1_equals_register_2)
);

adder IMM_ADDER(
    .A(pipe_pc_passthrough),
    .B(immediate_sexted),
    .Q(imm_adder_to_pc_mux)
);

signextend IMM_GEN_SIGN_EXTENDED(
    .IN(instruction),
    .OUT(immediate_sexted)
);

control_unit CONTROL_UNIT(
    .INSTRUCTION(instruction),
    .ALUOP(alu_operation),
    .PCSRC(control_pcsrc),
    .ALUSRC(control_alusrc_to_mux),
    .MEMTOREAD(control_memtoread_to_mux),
    .MEMWRITE(control_memwrite_to_mux),
    .MEMTOREG(control_memtoreg_to_mux),
    .REGWRITE(control_regwrite_to_mux)
);

and1 AND_BRANCHING(
    .A(register_1_equals_register_2),
    .B(control_pcsrc),
    .Q(and_branch_was_taken)
);

mux21 #(6) STALL_CONTROL_MUX (
    .SEL(stall_signal_for_mux),
    .IN0(control_signals_to_be_muxed),
    .IN1({9'b0}),
    .OUT(control_signals_from_mux)
);

pipe_id_ex PIPE_ID_EX(
    .clk(clk),
    .rst(rst),
    .ALUOP_IN(mux_aluop_to_id_ex),
    .ALUSRC_IN(mux_alusrc_to_id_ex),
    .REGWRITE_IN(mux_regwrite_to_id_ex),
    .MEMTOREG_IN(mux_memtoreg_to_id_ex),
    .MEMWRITE_IN(mux_memwrite_to_id_ex),
    .MEMREAD_IN(mux_memtoread_to_id_ex),
    .ARS1_IN(instruction[19:15]),
    .ARS2_IN(instruction[24:20]),
    .ARD_IN(instruction[11:7]),
    .RS1_IN(register_1),
    .RS2_IN(register_2),
    .IMMEDIATE_IN(immediate_sexted),

    .ALUOP_OUT(id_ex_aluop_to_alu),
    .ALUSRC_OUT(id_ex_alusrc_to_alusrc_mux),
    .REGWRITE_OUT(id_ex_regwrite_to_ex_mem),
    .MEMTOREG_OUT(id_ex_memtoreg_to_ex_mem),
    .MEMWRITE_OUT(id_ex_memwrite_to_ex_mem),
    .MEMREAD_OUT(id_ex_memtoread_to_hazards),
    .ARS1_OUT(id_ex_a_rs1_to_forwarding),
    .ARS2_OUT(id_ex_a_rs2_to_forwarding),
    .ARD_OUT(id_ex_a_rd_to_ex_mem),
    .RS1_OUT(id_ex_rs1_to_forward_a_mux),
    .RS2_OUT(id_ex_rs2_to_forward_b_mux),
    .IMMEDIATE_OUT(id_ex_imm_sexted_to_alu_src_mux)
);

hazard_unit HAZARD_UNIT(
    .MEMREAD_ID_EX(id_ex_memtoread_to_hazards),
    .BEQ_WRONG_PRED(register_1_equals_register_2),
    .OP_CODE(instruction[6:0]),
    .ARS1_IF_ID(instruction[19:15]),
    .ARS2_IF_ID(instruction[24:20]),
    .ARD_ID_EX(id_ex_a_rd_to_ex_mem),
    .STALL(hazard_unit_stall_signal),
    .MUX_SEL(stall_signal_for_mux),
    .PCWRITE(hazard_unit_pcwrite_signal)
);

mux41 FORWARD_A_MUX(
    .SEL(forwarding_forward_a_sel_signal),
    .IN0(id_ex_rs1_to_forward_a_mux),
    .IN1(ex_mem_result_op_to_data_mem),
    .IN2(data_mem_skip_mux_out_to_registers),
    .IN3({32'b0}),
    .OUT(forward_a_mux_to_alu_a_in)
);

mux41 FORWARD_B_MUX(
    .SEL(forwarding_forward_b_sel_signal),
    .IN0(id_ex_rs2_to_forward_b_mux),
    .IN1(ex_mem_result_op_to_data_mem),
    .IN2(data_mem_skip_mux_out_to_registers),
    .IN3({32'b0}),
    .OUT(forward_b_mux_to_alu_src_mux)
);

mux21 ALUSRC_MUX(
    .SEL(id_ex_alusrc_to_alusrc_mux),
    .IN0(forward_b_mux_to_alu_src_mux),
    .IN1(id_ex_imm_sexted_to_alu_src_mux),
    .OUT(alu_src_mux_to_alu_b_in)
);

alu ALU(
    .A(forward_a_mux_to_alu_a_in),
    .B(alu_src_mux_to_alu_b_in),
    .ALU_OPERATION(id_ex_aluop_to_alu),
    .ALU_RESULT(alu_out_to_ex_mem_pipe)
);

pipe_ex_mem PIPE_EX_MEM(
    .MEMWRITE_IN(id_ex_memwrite_to_ex_mem),
    .MEMTOREG_IN(id_ex_memtoreg_to_ex_mem),
    .REGWRITE_IN(id_ex_regwrite_to_ex_mem),
    .RESULTOP_IN(alu_out_to_ex_mem_pipe),
    .WR_DATA_IN(forward_b_mux_to_alu_src_mux),
    .ARD_IN(id_ex_a_rd_to_ex_mem),

    .MEMWRITE_OUT(ex_mem_memwrite_to_data_mem),
    .MEMTOREG_OUT(ex_mem_memtoreg_to_mem_wb),
    .REGWRITE_OUT(ex_mem_regwrite_to_mem_wb),
    .RESULTOP_OUT(ex_mem_result_op_to_data_mem),
    .WRDATA_OUT(ex_mem_wr_data_to_data_mem),
    .ARD_OUT(ex_mem_a_rd_to_mem_wb)
);

forwarding_unit FORWARDING_UNIT(
    .ARD_EX_MEM(ex_mem_a_rd_to_mem_wb),
    .ARD_MEM_WB(mem_wb_a_rd_to_registers),
    .ARS1(id_ex_a_rs1_to_forwarding),
    .ARS2(id_ex_a_rs2_to_forwarding),
    .REGWRITE_EX_MEM(ex_mem_regwrite_to_mem_wb),
    .REGWRITE_MEM_WB(mem_wb_regwrite_to_registers),
    .FORWARD_A(forward_a_mux_to_alu_a_in),
    .FORWARD_B(forward_b_mux_to_alu_src_mux)
);

XSPRAMLP_2048X32_M8P DATA_MEM(
    .CLK(clk),
    .CEn(1'b1),
    .A(ex_mem_result_op_to_data_mem),
    .D(ex_mem_wr_data_to_data_mem),
    .WEn(~ex_mem_memwrite_to_data_mem),//Es activo en bajo
    .Q(data_mem_out_to_mem_wb)

);

pipe_mem_wb PIPE_MEM_WB(
    .MEMTOREG_IN(ex_mem_memtoreg_to_mem_wb),
    .REGWRITE_IN(ex_mem_regwrite_to_mem_wb),
    .MEMDATA_IN(data_mem_out_to_mem_wb),
    .RESULTOP_IN(ex_mem_result_op_to_data_mem),
    .ARD_IN(ex_mem_a_rd_to_mem_wb),
    .MEMTOREG_OUT(mem_wb_memtoreg_to_data_mem_skip_mux),
    .REGWRITE_OUT(mem_wb_regwrite_to_registers),
    .MEMDATA_OUT(data_read_to_data_mem_skip_mux),
    .RESULTOP_OUT(result_op_to_data_mem_skip_mux),
    .ARD_OUT(mem_wb_a_rd_to_registers)

);

mux21 MEM_TO_REG_MUX(
    .SEL(mem_wb_memtoreg_to_data_mem_skip_mux),
    .IN0(data_read_to_data_mem_skip_mux),
    .IN1(result_op_to_data_mem_skip_mux),
    .OUT(data_mem_skip_mux_out_to_registers)
);

endmodule
