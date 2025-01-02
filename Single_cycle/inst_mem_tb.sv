`timescale 1ns / 1ps

module inst_mem_tb;
        
        parameter n = 32;
        logic [n-1:0] address;
        logic [n-1:0] instruction;
        logic [n-1:0] i;
        inst_mem #
                (n)
                rom (
                   .*      
                );
        
        initial begin
            for(i = 0; i < 32'h1111_1111; i = i + 4) begin
                address = i; #5;
            end
            $finish;
        end
        
endmodule