module counter_1 #(parameter tiempo_1 = 8'h0a) (
    input logic         clk,
    input logic         rst_n_i,
    input logic         en_i,
    input logic         load_en,
    input logic [7:0]   load_address,
    output logic        count_ended,
    output logic [7:0]  result
);

logic [7:0] transcurrido_1;
logic [7:0] cuenta;

//para detectar el flanco de la señal en_i
logic [1:0] registro_en_r;

always_ff@(posedge clk) begin
    registro_en_r <= {registro_en_r[0], en_i};
end

always_ff@(posedge clk) begin
    {count_ended} <= 0;
    result <= transcurrido_1;
    if(!rst_n_i) begin
        {transcurrido_1, count_ended, result} <= 0;
        cuenta <= tiempo_1;
    end else begin
        if(load_en) begin
            cuenta <= load_address;
        end else begin
            if(en_i) begin
                transcurrido_1 <= transcurrido_1 + 8'h01;
                if(transcurrido_1 >= cuenta) begin
                    count_ended <= 1'b1;
                    transcurrido_1 <= 8'b0;
                end
            end
        end
    end
end

endmodule
