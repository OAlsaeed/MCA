module imm_gen #(parameter WIDTH = 32)(
    input [ WIDTH - 1 : 0 ] inst,
    output logic [ WIDTH - 1 : 0 ] imm
    );

    logic [6:0] opcode;
    assign opcode = inst[6:0]; 

    always @ (*) begin
    case(opcode)
        7'b0010011 : imm <= {{20{inst[31]}},inst[31:20]}; //I-Type
        7'b0000011 : imm <= {{20{inst[31]}},inst[31:20]}; //I-Type
        7'b1100111 : imm <= {{20{inst[31]}},inst[31:20]}; //I-Type and jalr
        7'b1100011 : imm <= {{20{inst[31]}},inst[31:25],inst[11:8],inst[7]}; //B-Type
        7'b1101111 : imm <= {{12{inst[31]}}, inst[19:12], inst[20], inst[30:21], 1'b0}; // J-type               
        7'b0110111 : imm <= {inst[31:12],{12{1'b0}}}; //U-Type (lui)
        7'b0010111 : imm <= {inst[31:12],{12{1'b0}}}; //U-Type (auipc)
    default  : imm = '0;
    endcase
    end
    
endmodule