
module bsg_dff #(width_p=-1)
   (input   clock_i
    ,input  [width_p-1:0] data_i
    ,output [width_p-1:0] data_o
    );

   reg [width_p-1:0] data_r;

   assign data_o = data_r;

   always @(posedge clock_i)
     data_r <= data_i;

endmodule
