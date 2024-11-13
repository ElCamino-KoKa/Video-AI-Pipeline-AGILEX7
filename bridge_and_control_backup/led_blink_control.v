module led_blink_control (
    input wire [1:0] blink_flag,
    output wire led_1_out,
    input wire clock_sink_clk,
    input wire reset_sink_reset,
    input wire csr_write
);

  reg [31:0] BLINK_ON;
  reg blink_reg;


  assign led_1_out = blink_reg;


  always @(posedge clock_sink_clk or posedge reset_sink_reset) begin
    if (reset_sink_reset) begin
      BLINK_ON  <= 32'b0;
      blink_reg <= 1'b0;
    end else begin

      if (blink_flag == 2'b01) begin
        blink_reg <= 1'b1;
      end else if (blink_flag == 2'b001) begin
        BLINK_ON <= BLINK_ON + 1;
        if (BLINK_ON < 32'h2FAF080) begin
          blink_reg <= 1'b1;
        end else if (BLINK_ON > 32'h5F5E100) begin
          BLINK_ON <= 32'b0;
        end else begin
          blink_reg <= 1'b0;
        end
      end else if (blink_flag == 2'b11) begin
        if(csr_write) begin
        blink_reg <= ~blink_reg; end
      end else if (blink_flag == 2'b00) begin
        blink_reg <= 1'b0;
      end
    end
  end



endmodule
