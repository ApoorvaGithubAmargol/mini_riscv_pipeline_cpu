module data_memory(
    input clk,
    input mem_write,
    input [7:0] address,
    input [7:0] write_data,
    output [7:0] read_data
);

reg [7:0] memory [255:0];

initial begin
    memory[0] = 8'd50;
    memory[1] = 8'd25;
    memory[2] = 8'd100;
    memory[3] = 8'd75;
end

assign read_data = memory[address];

always @(posedge clk) begin
    if (mem_write)
        memory[address] <= write_data;
end

endmodule