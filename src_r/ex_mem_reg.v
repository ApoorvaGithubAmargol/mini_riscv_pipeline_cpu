module ex_mem_register(
    input clk,
    input reset,
    input [7:0] alu_result_in,
    input [7:0] write_data_in,

    output reg [7:0] alu_result_out,
    output reg [7:0] write_data_out
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        alu_result_out <= 8'd0;
        write_data_out <= 8'd0;
    end
    else begin
        alu_result_out <= alu_result_in;
        write_data_out <= write_data_in;
    end
end

endmodule