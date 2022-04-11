module counter_behav(count,rst,clk);
	input rst,clk;
	output reg [2:0] count;
	always@(posedge clk)
	if(rst)
		count<=3'b000;
	else
		count<=count+1;
endmodule

module test_mod;
	reg r,c;
	wire [2:0] ct;
	counter_behav countbeh(ct,r,c);
	initial
	begin
		$dumpfile("cnt_test.vcd");
		$dumpvars(0,test_mod);
		r=1;
		c=0;
		#100
		r=0;
		#200 $finish;
	end
	always #5 c=~c;
endmodule
