module cpu_top(
    input clk,
    input reset
);

wire [7:0] pc_out;
wire [7:0] instruction;

wire [7:0] if_id_pc;
wire [7:0] if_id_instruction;

wire [3:0] opcode;
wire reg_write;
wire mem_write;
wire mem_to_reg;
wire [2:0] alu_control;

wire [1:0] read_reg1;
wire [1:0] read_reg2;
wire [1:0] write_reg;

wire [7:0] read_data1;
wire [7:0] read_data2;

wire [7:0] id_ex_read_data1;
wire [7:0] id_ex_read_data2;
wire [2:0] id_ex_alu_control;

wire [7:0] alu_result;

wire [7:0] ex_mem_alu_result;
wire [7:0] ex_mem_write_data;

wire [7:0] mem_read_data;

wire [7:0] mem_wb_alu_result;
wire [7:0] mem_wb_mem_data;

assign opcode = if_id_instruction[7:4];
assign read_reg1 = if_id_instruction[3:2];
assign read_reg2 = if_id_instruction[1:0];
assign write_reg = if_id_instruction[3:2];

pc pc_inst (
    .clk(clk),
    .reset(reset),
    .pc_out(pc_out)
);

instruction_memory im_inst (
    .address(pc_out),
    .instruction(instruction)
);

if_id_register if_id_inst (
    .clk(clk),
    .reset(reset),
    .pc_in(pc_out),
    .instruction_in(instruction),
    .pc_out(if_id_pc),
    .instruction_out(if_id_instruction)
);

control_unit cu_inst (
    .opcode(opcode),
    .reg_write(reg_write),
    .mem_write(mem_write),
    .mem_to_reg(mem_to_reg),
    .alu_control(alu_control)
);

register_file rf_inst (
    .clk(clk),
    .reg_write(reg_write),
    .read_reg1(read_reg1),
    .read_reg2(read_reg2),
    .write_reg(write_reg),
    .write_data(mem_to_reg ? mem_wb_mem_data : mem_wb_alu_result),
    .read_data1(read_data1),
    .read_data2(read_data2)
);

id_ex_register id_ex_inst (
    .clk(clk),
    .reset(reset),
    .read_data1_in(read_data1),
    .read_data2_in(read_data2),
    .alu_control_in(alu_control),
    .read_data1_out(id_ex_read_data1),
    .read_data2_out(id_ex_read_data2),
    .alu_control_out(id_ex_alu_control)
);

alu alu_inst (
    .a(id_ex_read_data1),
    .b(id_ex_read_data2),
    .alu_control(id_ex_alu_control),
    .result(alu_result)
);

ex_mem_register ex_mem_inst (
    .clk(clk),
    .reset(reset),
    .alu_result_in(alu_result),
    .write_data_in(id_ex_read_data2),
    .alu_result_out(ex_mem_alu_result),
    .write_data_out(ex_mem_write_data)
);

data_memory dm_inst (
    .clk(clk),
    .mem_write(mem_write),
    .address(ex_mem_alu_result),
    .write_data(ex_mem_write_data),
    .read_data(mem_read_data)
);

mem_wb_register mem_wb_inst (
    .clk(clk),
    .reset(reset),
    .alu_result_in(ex_mem_alu_result),
    .mem_data_in(mem_read_data),
    .alu_result_out(mem_wb_alu_result),
    .mem_data_out(mem_wb_mem_data)
);

endmodule