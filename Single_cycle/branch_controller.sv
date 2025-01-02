module branch_controller #(parameter WIDTH=32) (
    input logic zero,
    input logic lessUnsigend,
    input logic lessSigend,
    input logic [2:0]func3,
    input logic branch,   
    output logic pc_sel                 
);
    always_comb begin
        case (func3)
            3'b000: pc_sel = (zero & branch) ? 1 : 0;   //beq
            3'b001: pc_sel = (!zero & branch) ? 1 : 0;  //bne
            3'b100: pc_sel = (lessSigend & branch) ? 1 : 0;   //blt 
            3'b101: pc_sel = (lessSigend & branch) ? zero : 1;  //bge
            3'b110: pc_sel = (lessUnsigend & branch) ? 1 : 0;   //bltu 
            3'b111: pc_sel = (!lessUnsigend & branch) ? zero : 1;  //bgeu 
        default: pc_sel = 0 ; 
        endcase
    end

endmodule