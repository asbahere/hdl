module Mux4to1(input [1:0]a,  input [1:0]b, input [1:0]c, input [1:0]d, input [1:0]sel, output [1:0]out);
	always @ (a or b or c or d or sel) 
	begin
	case (sel)
		2'b00: out = a;
                2'b01: out = b;
                2'b10: out = c;
                2'b11: out = d;
	endcase
	end
endmodule


module test;
	reg [1:0] a = 10;
	reg [1:0] b = 00;
	reg [1:0] c = 11;
	reg [1:0] d = 01;
	wire [1:0] out;
	reg [1:0] sel;
	
	Mux4to1(a, b, c, d, sel, out);
	initial begin
        	// Initialize Inputs
		$dumpfile(“Mux4to1.vcd”);
		$dumpvars(0, test);

		sel = 2'b00;
		#10
		sel = 2'b01;
		#10
		sel = 2'b10;
		#10
		sel = 2'b11;
		#10
		$finish;
		end
endmodule