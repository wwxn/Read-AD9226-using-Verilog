`timescale 1ns/1ns
module read_adc_tb();

reg clk_400M;
reg rst_n;
reg [11:0] adc_data_in;
wire adc_clk;
wire [11:0] adc_data_out;

read_adc r1
(
	clk_400M,
	rst_n,
	adc_data_in,
	adc_clk,
	adc_data_out
);

initial 
begin
	clk_400M<=1'b0;
	rst_n<=1'b1;
	#10;
	rst_n<=1'b0;
	#10;
	rst_n<=1'b1;
end

always #3 clk_400M<=~clk_400M;

endmodule 
	