`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
module fixedToFloat(
  input wire clk, 
  input wire rst , 
  input wire[31:0] targetnumber, 
  input wire[4:0] fixpointpos , 
  output wire[31:0] result );

reg [31:0] floatresult ;

// Your  Implementation 

// -------------------------------------------	
// Register the results 
// -------------------------------------------
integer i,mantissa,exponent;
always @ * begin
	if(targetnumber[31])begin
		floatresult = !targetnumber + 1;
		end
	for(i = 31; i >= 0 & targetnumber[i] != 1; i = i - 1)begin
	end
	
	floatresult[30:23] = i - fixpointpos + 127;
	floatresult[31] = targetnumber[31];
	floatresult[22:0] = targetnumber[0+:i-1];
	
	result <= floatresult;
end




endmodule
