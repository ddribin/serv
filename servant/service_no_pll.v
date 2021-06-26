`default_nettype none
module service
  (input wire  i_clk,
   input wire  i_rst,
   output wire q);

   parameter memfile = "zephyr_hello.hex";
   parameter memsize = 8192;

   reg            rst;
   reg            rst_r;

   always @(posedge i_clk)
     {rst_r, rst} <= {rst, i_rst};

   servant
     #(.memfile (memfile),
       .memsize (memsize))
   servant
     (.wb_clk (i_clk),
      .wb_rst (rst_r),
      .q      (q));

endmodule
