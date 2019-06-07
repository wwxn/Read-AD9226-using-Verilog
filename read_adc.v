module read_adc
(
	input clk_400M,
	input rst_n,
	input [11:0] adc_data_in,
	output adc_clk,
	output [11:0] adc_data_out,
	output compare_out
);

reg adc_clk_reg;
reg read_flag;
reg [1:0] counter;

assign compare_out=(adc_data_out>=12'd2048)?1'b0:1'b1;
assign adc_clk=adc_clk_reg;
assign adc_data_out=(read_flag)?adc_data_in:adc_data_out;

always@(posedge clk_400M)
if(!rst_n)
	counter<=2'b0;
else 
	counter<=counter+1'b1;
	
always@(posedge clk_400M)
if(!rst_n)
	adc_clk_reg<=1'b0;
else if(counter==2'b0)
	adc_clk_reg<=1'b0;
else if(counter==2'd2)
	adc_clk_reg<=1'b1;
	
	
always@(posedge clk_400M)
if(!rst_n)
	read_flag<=1'b0;
else if(counter==2'd3)
	read_flag<=1'b1;
else if(counter==2'd0)
	read_flag<=1'b0;

endmodule 
	
