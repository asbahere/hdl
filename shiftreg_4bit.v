module Rshiftregister(input clk,input clrb,input SDR,output reg[3:0]Q);
	always@(posedge(clk),negedge(clrb))
	if(~clrb)
		Q<=4'b0000;
	else
		Q<={SDR,Q[3:1]};
endmodule

module test_Rshiftregister;
	reg clk,clrb,SDR;
	wire[3:0]Q;
	Rshiftregister RS(c, clrb,SDR,Q);
	initial c = 0;
	always #50 c = ~c;
	initial
	begin
		$dumpfile("test_ShReg.vcd");
		$dumpvars(0,test_Rshiftregister);
		clk=1;
		clrb=0;
		SDR=1;
		  #100
		clrb=1;
		SDR=1;
		  #150
		SDR=0;
		 #200 $finish;
	end
endmodule
