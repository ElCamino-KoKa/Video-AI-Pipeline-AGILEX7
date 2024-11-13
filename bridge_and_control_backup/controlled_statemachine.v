module controlled_statemachine (
    input  wire [23:0] axi4stream_slave_tdata,
    output wire        axi4stream_slave_tready,
    input  wire [ 2:0] axi4stream_slave_tuser,
    input  wire        axi4stream_slave_tvalid,
    input  wire        axi4stream_slave_tlast,
    output wire [23:0] avalon_streaming_source_data,
    input  wire        avalon_streaming_source_ready,
    output wire        avalon_streaming_source_valid,
    input  wire        clock_sink_clk,
    input  wire        reset_sink_reset,
    input  wire        start_flag,
    output wire        led_2_out
);

  // Parameters
  parameter TOTAL_ROWS = 224;

  // Internal registers
  reg [31:0] avalon_streaming_source_data_reg;
  reg        avalon_streaming_source_valid_reg;
  reg        axi4stream_slave_tready_reg;
  reg      led_out_reg;
  //flags
  reg        finished_frame_flag;
  reg        resync_flag;
  reg        active_videodata_reg;
  //counters
  reg [31:0] pixel_counter;
  reg [ 7:0] row_counter;
  // Assign internal reg signals to output wires
  assign avalon_streaming_source_data = avalon_streaming_source_data_reg;
  assign avalon_streaming_source_valid = avalon_streaming_source_valid_reg;
  assign axi4stream_slave_tready = axi4stream_slave_tready_reg;
 assign led_2_out = led_out_reg;

  // States
  parameter [1:0] RESET = 2'b00;
  parameter [1:0] SYNC = 2'b01;
  parameter [1:0] VALIDDATA = 2'b10;
  parameter [1:0] PAUSE = 2'b11;
  reg [1:0] current_state, next_state;
  // Sequential logic for state transitions and register updates
  always @(posedge clock_sink_clk or posedge reset_sink_reset) begin
    if (reset_sink_reset) begin
      current_state <= RESET;
      finished_frame_flag <= 1'b0;
      avalon_streaming_source_data_reg <= 32'b0;
      avalon_streaming_source_valid_reg <= 1'b0;
      pixel_counter <= 32'b0;
      row_counter <= 8'b0;
      active_videodata_reg <= 1'b0;
      resync_flag <= 1'b1;
      axi4stream_slave_tready_reg <= 1'b1;
      led_out_reg<=1'b0;
    end else begin
      current_state <= next_state;
      avalon_streaming_source_data_reg <= 32'b0;
      avalon_streaming_source_valid_reg <= 1'b0;

      case (next_state)
        RESET: begin
        end
        SYNC: begin
          avalon_streaming_source_valid_reg <= 1'b0;
          axi4stream_slave_tready_reg <= 1'b1;
          if ((axi4stream_slave_tuser[0] == 1) && (axi4stream_slave_tuser[1] == 0)) begin
            active_videodata_reg <= 1'b1;
            resync_flag <= 1'b0;
          end else begin
            active_videodata_reg <= 1'b0;
          end
        end

        VALIDDATA: begin
          axi4stream_slave_tready_reg <= avalon_streaming_source_ready;
          if (axi4stream_slave_tuser[1] == 0) begin
          if( axi4stream_slave_tvalid) begin
              avalon_streaming_source_data_reg  <= axi4stream_slave_tdata;
              avalon_streaming_source_valid_reg <= 1'b1;
              pixel_counter <= pixel_counter + 1;
                if ((axi4stream_slave_tlast)) begin
                  if (row_counter < TOTAL_ROWS - 1) begin
                    row_counter <= row_counter + 1;
                    pixel_counter <= 31'b0;
                  end else if (row_counter == TOTAL_ROWS - 1) begin  //last row
                    row_counter <= 8'b0;
                    pixel_counter <= 31'b0;
                  end
                end
              end else begin
                avalon_streaming_source_valid_reg <= 1'b0;
            end
          end else begin
            avalon_streaming_source_valid_reg <= 1'b0;
            finished_frame_flag <= 1'b1;
            led_out_reg<= ~led_out_reg;
          end
        end

        PAUSE: begin
          finished_frame_flag <= 1'b0;
          avalon_streaming_source_valid_reg <= 1'b0;
          axi4stream_slave_tready_reg <= avalon_streaming_source_ready;
        end
      endcase
    end
  end

  // Combinational logic for next state determination
  always @(*) begin
    next_state = current_state;
    case (current_state)
      RESET: begin
        next_state = PAUSE;
      end
      SYNC: begin
        if (active_videodata_reg) begin
          next_state = VALIDDATA;
        end
      end
      VALIDDATA: begin
        if (finished_frame_flag) begin
          next_state = PAUSE;
        end else if (resync_flag) begin
          next_state = SYNC;
        end
      end
      PAUSE: begin
        if (start_flag) begin
          next_state = SYNC;
        end
      end
      default: next_state = RESET;
    endcase
  end
endmodule
