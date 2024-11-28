module csr_handler (
    input wire csr_read,
    output wire [31:0] csr_readdata,
    input wire csr_write,
    input wire [7:0] csr_address,
    input wire [31:0] csr_writedata,
    output reg [2:0] led_1_flag,
    output reg start_flag,
    input wire clock_sink_clk,
    input wire reset_sink_reset
);

  reg [31:0] csr_writedata_reg;
  reg repeat_start_flag;
  reg [3:0]  start_counter;  // Counter for start_flag
  localparam COUNTER_MAX = 4;  // Number of clock cycles for start_flag high
  
  assign csr_readdata = 32'h12345678; // Fixed output when read from Component

  always @(posedge clock_sink_clk or posedge reset_sink_reset) begin
    if (reset_sink_reset) begin
      csr_writedata_reg <= 32'b0;
      led_1_flag <= 2'b10;
      start_flag <= 1'b0;
      start_counter <= 4'b0;
      repeat_start_flag <= 1'b0;
    end else begin
      if (csr_write) begin
      csr_writedata_reg <= csr_writedata;
      start_flag <= csr_writedata_reg[0];
      repeat_start_flag <= csr_writedata_reg[1];
      led_1_flag <= csr_writedata_reg[4:2];
      end
       // Counter logic to reset start_flag after 4 clock cycles
      if (start_flag && ~repeat_start_flag) begin
        if (start_counter < COUNTER_MAX - 1) begin
          start_counter <= start_counter + 1;
        end else begin
          start_flag <= 1'b0;  // Reset start_flag
          start_counter <= 4'b0;  // Reset counter
          end 
      end else begin
        start_counter <= 4'b0;  // Reset counter when start_flag is not active
      end  
       if(repeat_start_flag) begin
          start_flag <= 1'b1;  // Keep start_flag high
        end
    end
  end 
  
endmodule

