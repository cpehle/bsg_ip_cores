// MBT 7/25/2014
// async pointer
//
// In this design, there are two clock domains. The first
// clock domain (w_) increments the grey-coded pointer; and the
// clock domain (r_) reads the grey-coded pointer.
//
// w_: signals in "receive credits" clock domain
// r_: signals in "spend credits" clock domain
//

// RESET: both resets must be asserted and w_ clock most be posedge toggled
// at least once; and the r_ clock posedge toggled at least three times after that.
// This will be a sufficient number of clocks to pass through the synchronizers.

module bsg_async_ptr_gray #(parameter lg_size_p = -1
                            ,parameter use_negedge_for_launch_p=0)
   (
    input w_clk_i
    , input w_reset_i
    , input w_inc_i               // increment pointer
    , input r_clk_i
    , output [lg_size_p-1:0] w_ptr_binary_r_o     // ptr value; binary
    , output [lg_size_p-1:0] w_ptr_gray_r_o       // same; gray coded; value before synchronizers
    , output [lg_size_p-1:0] w_ptr_gray_r_rsync_o // value after  synchronizers
    );

   logic [lg_size_p-1:0] w_ptr_r,      w_ptr_n;
   logic [lg_size_p-1:0] w_ptr_p1_r,   w_ptr_p1_n, w_ptr_p2;
   logic [lg_size_p-1:0] w_ptr_gray_n, w_ptr_gray_r, w_ptr_gray_r_rsync;

   // minor fixme: this could possibly be done more efficiently or at least more elegantly
   // with a bsg_binary_plus_one_to_gray module. something like
   // assign w_ptr_n = w_inc_i ? w_ptr_r+1 : w_ptr_r;
   // assign w_ptr_gray_n = w_inc_i ? (bsg_binary_plus_one_to_gray(w_ptr_r) : (wptr_r >> 1) ^ wptr_r;
       
// cycle time optimization
//   assign w_ptr_n      = w_ptr_r + w_inc_i;
//   assign w_ptr_gray_n = (w_ptr_n >> 1) ^ w_ptr_n;

   assign w_ptr_p2     = w_ptr_p1_r + 1'b1;
   assign w_ptr_n      = w_inc_i ? w_ptr_p1_r : w_ptr_r;
   assign w_ptr_p1_n   = w_inc_i ? w_ptr_p2   : w_ptr_p1_r;

   assign w_ptr_gray_n = w_inc_i ? ((w_ptr_p1_r >> 1) ^ w_ptr_p1_r) : w_ptr_gray_r;

   // pointer, in binary
   // feature wish: pass in negedge or posedge as parameter!
generate
   if (use_negedge_for_launch_p)
     begin
        always @(negedge w_clk_i)
          if (w_reset_i)
            begin
               w_ptr_r    <= 0;
               w_ptr_p1_r <= 1;
            end
          else
            begin
               w_ptr_r    <= w_ptr_n;
               w_ptr_p1_r <= w_ptr_p1_n;
            end
     end
   else
     begin
        always @(posedge w_clk_i)
          if (w_reset_i)
            begin
               w_ptr_r    <= 0;
               w_ptr_p1_r <= 1;
            end
          else
            begin
               w_ptr_r    <= w_ptr_n;
               w_ptr_p1_r <= w_ptr_p1_n;
            end
     end
endgenerate

   assign w_ptr_binary_r_o = w_ptr_r;

   // synchronize the grey coded pointer across clock domains
   // we use these to send pointers across clock boundaries
   // this includes both launch flops and synchronization flops
   // these should be abutted in physical design

   bsg_launch_sync_sync #(.width_p(lg_size_p)
                          ,.use_negedge_for_launch_p(use_negedge_for_launch_p)) ptr_sync
     (
      .iclk_i(w_clk_i)
      ,.iclk_reset_i(w_reset_i)
      ,.oclk_i(r_clk_i)
      ,.iclk_data_i(w_ptr_gray_n)
      ,.iclk_data_o(w_ptr_gray_r)
      ,.oclk_data_o(w_ptr_gray_r_rsync)
      );

   // fixme: probably wise to put a dont_touch'ed buffer cell on the launch flop.
   assign w_ptr_gray_r_o       = w_ptr_gray_r;
   assign w_ptr_gray_r_rsync_o = w_ptr_gray_r_rsync;

endmodule
