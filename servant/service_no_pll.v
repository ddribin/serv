`default_nettype none
module service
  (input wire  i_clk,
   output wire q);

   parameter memfile = "zephyr_hello.hex";
   parameter memsize = 8192;

   reg [20:0]     rst_count;
   reg            rst_r;

  always @(posedge i_clk) begin
    if (rst_count < 21'd2_000_000) begin
      rst_r <= 1;
      rst_count <= rst_count + 21'd1;
    end else begin
      rst_r <= 0;
    end
   end

   servant
     #(.memfile (memfile),
       .memsize (memsize))
   servant
     (.wb_clk (i_clk),
      .wb_rst (rst_r),
      .q      (q));

endmodule
