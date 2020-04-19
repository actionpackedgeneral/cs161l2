`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
module fixedToFloat(
  input wire clk, 
  input wire rst , 
  input wire[31:0] targetnumber, 
  input wire[4:0] fixpointpos ,
//  output reg[4:0] j,
  output reg[31:0] result );

reg [31:0] floatresult ;
reg [4:0] vbit;

// Your  Implementation 

// -------------------------------------------	
// Register the results 
// -------------------------------------------
integer b,mantissa,exponent,i;
always @* begin
	floatresult = targetnumber;
	
	floatresult = (targetnumber[31]) ? !floatresult + 1 : floatresult;
	b = 31;
	while(b > 0 && floatresult[b] != 1)begin
		b = b -1;
		end
	if(b < 23)begin
		floatresult = floatresult << 23 - b;
		end
	else begin
		floatresult = floatresult >> b - 23;
		end
	exponent = b - fixpointpos + 127;
	floatresult[30:23] = exponent;
	if(!targetnumber || rst)begin
		floatresult = floatresult & 32'h0;
		end
//	j = b;
	
	result = floatresult;
end



endmodule
