module id_ex_register(
    input clk,
    input reset,
    input [7:0] read_data1_in,
    input [7:0] read_data2_in,
    input [2:0] alu_control_in,
    output reg [7:0] read_data1_out,
    output reg [7:0] read_data2_out,
    output reg [2:0] alu_control_out
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        read_data1_out <= 8'd0;
        read_data2_out <= 8'd0;
        alu_control_out <= 3'd0;
    end
    else begin
        read_data1_out <= read_data1_in;
        read_data2_out <= read_data2_in;
        alu_control_out <= alu_control_in;
    end
end

endmodule