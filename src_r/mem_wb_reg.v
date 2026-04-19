module mem_wb_register(
    input clk,
    input reset,
    input [7:0] alu_result_in,
    input [7:0] mem_data_in,

    output reg [7:0] alu_result_out,
    output reg [7:0] mem_data_out
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        alu_result_out <= 8'd0;
        mem_data_out <= 8'd0;
    end
    else begin
        alu_result_out <= alu_result_in;
        mem_data_out <= mem_data_in;
    end
end

endmodule