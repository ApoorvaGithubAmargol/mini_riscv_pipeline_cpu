module instruction_memory(
    input [7:0] address,
    output reg [7:0] instruction
);

always @(*) begin
    case(address)
        8'd0: instruction = 8'b00010001;
        8'd1: instruction = 8'b00100110;
        8'd2: instruction = 8'b01100001;
        8'd3: instruction = 8'b01110010;
        8'd4: instruction = 8'b01010010;
        default: instruction = 8'b00000000;
    endcase
end

endmodule