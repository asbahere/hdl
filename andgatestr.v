module and_gate(A,B,x); // OR gate used as a procedure in simulation
  input A,B;           	// defines two input port
  output x;            	// defines one output port 
  and g1(x,A,B);  	//Gate declaration                   
endmodule

module andgate_tb; 		//Simulation module given name andgate_tb
	reg A,B; 		//Storage of data for passing it to module or_gate
	wire x;
	and_gate andg(A,B,x);  	//circuit is instantiated with the name, and_gate
	initial  		//starts simulation
	begin    		//Input is generated to test the circuit through                                   following statements, simulation begins
		
		$dumpfile("andgate_testbed.vcd");
		$dumpvars(0,andgate_tb);
		A=1'b0;B=1'b0; 	// 1'b0 signifies binary digit with a value 0,                                         AB is assigned 00
    		#20             // Delay of 20 ns
    		A=1'b0;B=1'b1;  // After 20ns AB=01    
    		#20		// Another Delay of 20 ns
    		A=1'b1;B=1'b0; 	// After 40ns from start point  AB=10    
    		#20
    		A=1'b1;B=1'b1; 	// After 60ns from start point  AB=11    
    		#20 $finish;	// the simulation terminates after 80 ns
  	end
endmodule



  
   

