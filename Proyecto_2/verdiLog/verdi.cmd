simSetSimulator "-vcssv" -exec "./simv" -args " " -uvmDebug on
debImport "-i" "-simflow" "-dbdir" "./simv.daidir"
srcTBInvokeSim
wvCreateWindow
srcHBSelect "z_pipeline_tb.pipeline_prueba.INST_MEM" -win $_nTrace1
srcHBSelect "z_pipeline_tb.pipeline_prueba.INST_MEM" -win $_nTrace1
srcSetScope "z_pipeline_tb.pipeline_prueba.INST_MEM" -delim "." -win $_nTrace1
srcHBSelect "z_pipeline_tb.pipeline_prueba.INST_MEM" -win $_nTrace1
srcSignalViewSelect "z_pipeline_tb.pipeline_prueba.INST_MEM.read_adr\[10:0\]"
srcSetScope "z_pipeline_tb.pipeline_prueba.INST_MEM" -delim "." -win $_nTrace1
srcHBDrag -win $_nTrace1
wvDumpScope "z_pipeline_tb.pipeline_prueba.IMM_GEN_SIGN_EXTENDED"
wvRenameGroup -win $_nWave3 {G1} {IMM_GEN_SIGN_EXTENDED}
wvAddSignal -win $_nWave3 \
           "/z_pipeline_tb/pipeline_prueba/IMM_GEN_SIGN_EXTENDED/IN\[31:0\]" \
           "/z_pipeline_tb/pipeline_prueba/IMM_GEN_SIGN_EXTENDED/OUT\[31:0\]"
wvSetPosition -win $_nWave3 {("IMM_GEN_SIGN_EXTENDED" 0)}
wvSetPosition -win $_nWave3 {("IMM_GEN_SIGN_EXTENDED" 2)}
wvSetPosition -win $_nWave3 {("IMM_GEN_SIGN_EXTENDED" 2)}
wvSelectGroup -win $_nWave3 {IMM_GEN_SIGN_EXTENDED}
wvSelectGroup -win $_nWave3 {IMM_GEN_SIGN_EXTENDED}
wvCut -win $_nWave3
wvSetPosition -win $_nWave3 {("G2" 0)}
srcHBSelect "z_pipeline_tb.pipeline_prueba.INST_MEM" -win $_nTrace1
srcSetScope "z_pipeline_tb.pipeline_prueba.INST_MEM" -delim "." -win $_nTrace1
srcHBSelect "z_pipeline_tb.pipeline_prueba.INST_MEM" -win $_nTrace1
srcSignalViewSelect "z_pipeline_tb.pipeline_prueba.INST_MEM.read_adr\[10:0\]"
wvAddSignal -win $_nWave3 \
           "/z_pipeline_tb/pipeline_prueba/INST_MEM/read_adr\[10:0\]"
wvSetPosition -win $_nWave3 {("G2" 0)}
wvSetPosition -win $_nWave3 {("G2" 1)}
wvSetPosition -win $_nWave3 {("G2" 1)}
srcSignalViewSelect "z_pipeline_tb.pipeline_prueba.INST_MEM.clk"
wvSetPosition -win $_nWave3 {("G2" 0)}
wvAddSignal -win $_nWave3 "/z_pipeline_tb/pipeline_prueba/INST_MEM/clk"
wvSetPosition -win $_nWave3 {("G2" 0)}
wvSetPosition -win $_nWave3 {("G2" 1)}
srcSignalViewSelect "z_pipeline_tb.pipeline_prueba.INST_MEM.instruction\[31:0\]"
wvSetPosition -win $_nWave3 {("G2" 0)}
wvSetPosition -win $_nWave3 {("G2" 1)}
wvSetPosition -win $_nWave3 {("G2" 2)}
wvSetPosition -win $_nWave3 {("G3" 0)}
wvSetPosition -win $_nWave3 {("G2" 2)}
wvAddSignal -win $_nWave3 \
           "/z_pipeline_tb/pipeline_prueba/INST_MEM/instruction\[31:0\]"
wvSetPosition -win $_nWave3 {("G2" 2)}
wvSetPosition -win $_nWave3 {("G2" 3)}
srcHBDrag -win $_nTrace1
wvSetPosition -win $_nWave3 {("G2" 0)}
wvSetPosition -win $_nWave3 {("G2" 3)}
wvSetPosition -win $_nWave3 {("G3" 0)}
wvDumpScope "z_pipeline_tb.pipeline_prueba.FORWARD_A_MUX"
wvRenameGroup -win $_nWave3 {G3} {FORWARD_A_MUX}
wvAddSignal -win $_nWave3 \
           "/z_pipeline_tb/pipeline_prueba/FORWARD_A_MUX/SEL\[1:0\]" \
           "/z_pipeline_tb/pipeline_prueba/FORWARD_A_MUX/IN0\[31:0\]" \
           "/z_pipeline_tb/pipeline_prueba/FORWARD_A_MUX/IN1\[31:0\]" \
           "/z_pipeline_tb/pipeline_prueba/FORWARD_A_MUX/IN2\[31:0\]" \
           "/z_pipeline_tb/pipeline_prueba/FORWARD_A_MUX/IN3\[31:0\]" \
           "/z_pipeline_tb/pipeline_prueba/FORWARD_A_MUX/OUT\[31:0\]"
wvSetPosition -win $_nWave3 {("FORWARD_A_MUX" 0)}
wvSetPosition -win $_nWave3 {("FORWARD_A_MUX" 6)}
wvSetPosition -win $_nWave3 {("FORWARD_A_MUX" 6)}
srcTBRunSim
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvScrollDown -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollUp -win $_nWave3 1
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
