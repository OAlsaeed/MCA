module alu #(parameter WIDTH=32) (
    input  logic [WIDTH-1:0] op1, op2,       
    input  logic [3:0] alu_ctrl,             
    output logic [WIDTH-1:0] alu_result,     
    output logic zero,  
    output logic lessSigend,
    output logic lessUnsigend                     
);

    always @(*) begin
        case (alu_ctrl)
            4'b0000: alu_result = op1 + op2;                // ADD
            4'b1000: alu_result = op1 - op2;                // SUB
            4'b0111: alu_result = op1 & op2;                // AND
            4'b0110: alu_result = op1 | op2;                // OR
            4'b0100: alu_result = op1 ^ op2;                // XOR
            4'b0001: alu_result = op1 << op2;               // SLL 
            4'b0101: alu_result = op1 >> op2;               // SRL 
            4'b1101: alu_result = $signed(op1) >>> op2;     // SRA 
            4'b0010: alu_result = ($signed(op1) < $signed(op2)) ? 1 : 0; // SLT 
            4'b0011: alu_result = (op1 < op2) ? 1 : 0;       // SLTU 
            default: alu_result = 1'bx;                        
        endcase
        
        
        if ($unsigned(op1) < $unsigned(op2)) begin
            lessUnsigend = 1;
        end else begin
            lessUnsigend = 0;
        end

        if ($signed(op1) < $signed(op2))
            lessSigend = 1;
        else 
            lessSigend = 0;
        
        zero = (alu_result == 0) ? 1'b1 : 1'b0;
    end
endmodule