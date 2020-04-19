`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
module floatToFixed(
  input wire clk, 
  input wire rst , 
  input wire[31:0] float, 
  input wire[4:0] fixpointpos ,
//  output reg[4:0] j,
  output reg[31:0] result );

reg [31:0] fixedresult ; 
reg [5:0] vbit;
reg sign;
 //Your  Implementation 


// -------------------------------------------	
// Register the results 
// -------------------------------------------
integer i,exponent,mantissa;
always @(*) begin
	
	fixedresult = float;
	
	sign = fixedresult[31];
	i = 0;
	while(!fixedresult[i] && i < 23)begin
		i = i + 1;
	end
	fixedresult[31:24] = 0;
	fixedresult[23] = 1;
	fixedresult = fixedresult >> i;
	if(sign)begin
		fixedresult = ~fixedresult + 1;
		end
//	j = i;
	result = fixedresult;
end

endmodule
