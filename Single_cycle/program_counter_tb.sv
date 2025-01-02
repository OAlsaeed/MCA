`timescale 1ns / 1ps

module program_counter_tb;
            
            localparam n = 32;
            
            logic clk;
            logic reset_n;
            logic [n-1:0] data_in;
            logic [n-1:0] data_o;

            program_counter #(n) pc(
                                    .clk(clk),
                                    .reset_n(reset_n),
                                    .data_in(data_in),
                                    .data_o(data_o)
                                );
                                
             initial begin
             clk = 0;
        forever begin 
              #2 clk = ~clk;
        end
    end
            
           // initial begin
           //     clk = 0;
          //      reset_n = 0;
          //      #2 reset_n =1;                
          //  end
            
            
           
           
           initial begin
               reset_n = 0;
               #2 reset_n =1; 
               data_in = 1;  #5
               data_in = 20; #5
               $finish;
           end
endmodule
