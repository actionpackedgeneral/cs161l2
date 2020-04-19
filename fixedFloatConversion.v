`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
module fixedFloatConversion(
  input wire clk, 
  input wire rst , 
  input wire[31:0] targetnumber, 
  input wire[4:0] fixpointpos , 
  input wire opcode , // 1 is float to fix, 0 is fix to float
//  output reg [4:0] j,
  output reg[31:0] result );

wire [31:0] floatresult ; 
wire [31:0] fixresult ;
wire [4:0] floatbit;
wire [4:0] fixbit;

// -------------------------------------------
// From fix to float (Part 1)
// -------------------------------------------
fixedToFloat fixToFloat(.clk(clk),.rst(rst),
    .targetnumber(targetnumber),.fixpointpos(fixpointpos),
    .result(floatresult));

// -------------------------------------------	
// From float to fix (Part 2)
// -------------------------------------------
floatToFixed floatToFix(.clk(clk),.rst(rst),
    .float(targetnumber),.fixpointpos(fixpointpos),
    .result(fixresult));

// -------------------------------------------	
// Register the results 
// -------------------------------------------

always @ (*) begin 
    // Implement your synchronous reset
    result <= (opcode) ? fixresult:floatresult;
//	 j <= (opcode) ? fixbit: floatbit;
	 

end 
endmodule
