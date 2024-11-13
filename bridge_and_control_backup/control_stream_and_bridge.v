`timescale 1 ps / 1 ps
module control_stream_and_bridge (
    input  wire [23:0] axi4stream_slave_tdata,   // axi4stream_slave.tdata
    output wire        axi4stream_slave_tready,  // .tready
    input  wire [ 2:0] axi4stream_slave_tuser,   // .tuser
    input  wire        axi4stream_slave_tvalid,  // .tvalid
    input  wire        axi4stream_slave_tlast,   // .tlast

    input wire clock_sink_clk,   // clock_sink.clk
    input wire reset_sink_reset, // reset_sink.reset

    output wire [23:0] avalon_streaming_source_data,   // avalon_streaming_source.data
    input  wire        avalon_streaming_source_ready,  // .ready
    output wire        avalon_streaming_source_valid,  // .valid

    input  wire        csr_read,
    output wire [31:0] csr_readdata,
    input  wire        csr_write,
    input  wire [ 7:0] csr_address,
    input  wire [31:0] csr_writedata,

    output wire led_out_1,
    output wire led_out_2
    
);

  wire [2:0] blink_flag;
  wire start_flag;


  controlled_statemachine controlled_statemachine_inst (
      .axi4stream_slave_tdata(axi4stream_slave_tdata),
      .axi4stream_slave_tready(axi4stream_slave_tready),
      .axi4stream_slave_tuser(axi4stream_slave_tuser),
      .axi4stream_slave_tvalid(axi4stream_slave_tvalid),
      .axi4stream_slave_tlast(axi4stream_slave_tlast),
      .avalon_streaming_source_data(avalon_streaming_source_data),
      .avalon_streaming_source_ready(avalon_streaming_source_ready),
      .avalon_streaming_source_valid(avalon_streaming_source_valid),
      .clock_sink_clk(clock_sink_clk),
      .reset_sink_reset(reset_sink_reset),
      .led_2_out(led_out_2),
      .start_flag(start_flag)
  );


  led_blink_control led_blink_control_inst (
      .blink_flag(blink_flag),
      .led_1_out(led_out_1),
      .clock_sink_clk(clock_sink_clk),
      .reset_sink_reset(reset_sink_reset),
      .csr_write(csr_write)
  );


  csr_handler csr_handler_inst (
      .csr_read(csr_read),
      .csr_readdata(csr_readdata),
      .csr_write(csr_write),
      .csr_address(csr_address),
      .csr_writedata(csr_writedata),
      .led_1_flag(blink_flag),
      .start_flag(start_flag),
      .clock_sink_clk(clock_sink_clk),
      .reset_sink_reset(reset_sink_reset)
  );

endmodule
