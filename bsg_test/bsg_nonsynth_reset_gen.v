//**********************************************************************
// Reset
//  ______  _______  ______ _______ _______
// (_____ \(_______)/ _____|_______|_______)
//  _____) )_____  ( (____  _____      _
// |  __  /|  ___)  \____ \|  ___)    | |
// | |  \ \| |_____ _____) ) |_____   | |
// |_|   |_|_______|______/|_______)  |_|
//
//**********************************************************************


module bsg_nonsynth_reset_gen #(parameter num_clocks_p=1
				, parameter reset_cycles_lo_p="inv"
				, parameter reset_cycles_hi_p="inv")
   (input [num_clocks_p-1:0] clk_i
    , output logic           async_reset_o);

   genvar i;

   logic [$clog2(reset_cycles_lo_p+1)-1:0] ctr_lo_r[num_clocks_p-1:0];
   logic [$clog2(reset_cycles_hi_p+1)-1:0] ctr_hi_r[num_clocks_p-1:0];
   logic [num_clocks_p-1:0] phase_lo_r;
   logic [num_clocks_p-1:0] phase_hi_r;

   wire 				   in_phase_1 = & phase_lo_r;
   wire 				   in_phase_2 = & phase_hi_r;

   for (i = 0; i < num_clocks_p; i=i+1)
     begin : rof
	initial ctr_lo_r[i] = 0;
        initial ctr_hi_r[i] = 0;

        assign phase_lo_r[i] = (ctr_lo_r[i] == reset_cycles_lo_p);
        assign phase_hi_r[i] = (ctr_hi_r[i] == reset_cycles_hi_p);

        always @(negedge clk_i[i])
          if (!phase_lo_r[i])
	    ctr_lo_r[i] <= ctr_lo_r[i] + 1;
	  else if (~phase_hi_r[i])
	    ctr_hi_r[i] <= ctr_hi_r[i] + in_phase_1;
     end

   assign async_reset_o = (in_phase_1 ^ in_phase_2);

   always @(negedge async_reset_o)
     begin
        $display("__________ ___________  _______________________________");
        $display("\\______   \\\\_   _____/ /   _____/\\_   _____/\\__    ___/");
        $display(" |       _/ |    __)_  \\_____  \\  |    __)_   |    |   ");
        $display(" |    |   \\ |        \\ /        \\ |        \\  |    |   ");
        $display(" |____|_  //_______  //_______  //_______  /  |____|   ");
        $display(" ASYNC  \\/         \\/         \\/         \\/            ");
     end
endmodule

