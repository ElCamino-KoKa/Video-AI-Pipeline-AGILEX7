// stream_in_component.v

// This file was auto-generated as a prototype implementation of a module
// created in component editor.  It ties off all outputs to ground and
// ignores all inputs.  It needs to be edited to make it do something
// useful.
// 
// This file will not be automatically regenerated.  You should check it in
// to your version control system if you want to keep it.

`timescale 1 ps / 1 ps
module stream_in_component (
		input  wire [23:0] avalon_streaming_sink_data,  // avalon_streaming_sink.data
		output wire        avalon_streaming_sink_ready, //                      .ready
		input  wire        avalon_streaming_sink_valid, //                      .valid
		input  wire        clock_sink_clk,              //            clock_sink.clk
		input  wire        reset_sink_reset             //            reset_sink.reset
	);

	// TODO: Auto-generated HDL template
	reg [23:0] avalon_streaming_sink_data_reg;
	reg [8:0]counter;
	reg avalon_streaming_sink_ready_reg;
	parameter ROWS = 224;
	assign avalon_streaming_sink_ready = avalon_streaming_sink_ready_reg;


	always @(posedge clock_sink_clk or posedge reset_sink_reset) begin
		if (reset_sink_reset) begin
			avalon_streaming_sink_ready_reg <= 1'b0;
			counter <= 32'h0;
		end else begin
			avalon_streaming_sink_ready_reg <= 1'b1;
			avalon_streaming_sink_data_reg <= avalon_streaming_sink_data;
			/*counter <= counter + 1;
			if(counter > ROWS-1) begin
				avalon_streaming_sink_ready_reg <= 1'b0;
			end*/
		end
		
	end

endmodule
