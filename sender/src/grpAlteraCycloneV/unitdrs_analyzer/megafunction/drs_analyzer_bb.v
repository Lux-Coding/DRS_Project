
module drs_analyzer (
	acq_data_in,
	acq_trigger_in,
	acq_clk,
	trigger_in);	

	input	[127:0]	acq_data_in;
	input	[0:0]	acq_trigger_in;
	input		acq_clk;
	input		trigger_in;
endmodule
