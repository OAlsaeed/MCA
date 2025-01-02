module control_unit #(parameter WIDTH = 32)
    (
    input logic [ WIDTH - 1 : 0 ] inst,
    input logic zero,
    input logic lessUnsigend,
    input logic lessSigend,  
    output logic reg_write,
    output logic mem_write,
    output logic mem_to_reg,
    output logic alu_src,
    output logic [3:0] alu_ctrl,
    output logic pc_sel    

);

    logic [2:0]func3;
    logic [6:0]func7;
    logic branch;

    assign func3 = inst[14:12];
    assign func7 = inst[31:25];

    logic [1:0] alu_op;

    main_control mc(
                .opcode(inst[6:0]),
                .reg_write(reg_write),
                .mem_write(mem_write),
                .mem_to_reg(mem_to_reg),
                .alu_op(alu_op),
                .alu_src(alu_src),
                .branch(branch)
    );
    
    alu_control aluctrl(
                .func3(func3),
                .func7(func7),
                .alu_op(alu_op),
                .alu_ctrl(alu_ctrl)
    );
    
    branch_controller #(WIDTH) bctrl(
        .zero(zero),
        .lessUnsigend(lessUnsigend),
        .lessSigend(lessSigend),
        .func3(func3),
        .branch(branch),   
        .pc_sel(pc_sel)                 
    );

endmodule