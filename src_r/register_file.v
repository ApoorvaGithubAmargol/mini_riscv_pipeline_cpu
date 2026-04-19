module register_file(
    input clk,
    input reg_write,
    input [1:0] read_reg1,
    input [1:0] read_reg2,
    input [1:0] write_reg,
    input [7:0] write_data,
    output [7:0] read_data1,
    output [7:0] read_data2
);

reg [7:0] registers [3:0];

initial begin
    registers[0] = 8'd10;
    registers[1] = 8'd5;
    registers[2] = 8'd3;
    registers[3] = 8'd1;
end

assign read_data1 = registers[read_reg1];
assign read_data2 = registers[read_reg2];

always @(posedge clk) begin
    if (reg_write)
        registers[write_reg] <= write_data;
end

endmodule