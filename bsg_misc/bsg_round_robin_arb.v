// Round robin arbitration unit

// Automatically generated using bsg_round_robin_arb.py
// DO NOT MODIFY

module bsg_round_robin_arb #(parameter inputs_p = "not assigned")
    (input clk_i
    , input reset_i
    , input ready_i
    , input [inputs_p-1:0] reqs_i
    , output [inputs_p-1:0] grants_o
    );

logic [inputs_p-1:0] grants;
logic [`BSG_SAFE_CLOG2(inputs_p)-1:0] last, last_n, last_r;

assign grants_o = grants;

if(inputs_p == 1)
begin: inputs_1
always_comb
begin
  unique casez({ready_i, last_r, reqs_i})
    3'b0_?_?: grants = 1'b0;
    3'b1_?_0: grants = 1'b0;
    3'b1_0_1: grants = 1'b1;
    default: grants = {1{1'bx}};
  endcase
end
end: inputs_1

if(inputs_p == 2)
begin: inputs_2
always_comb
begin
  unique casez({ready_i, last_r, reqs_i})
    4'b0_?_??: grants = 2'b00;
    4'b1_?_00: grants = 2'b00;
    4'b1_0_1?: grants = 2'b10;
    4'b1_0_01: grants = 2'b01;
    4'b1_1_?1: grants = 2'b01;
    4'b1_1_10: grants = 2'b10;
    default: grants = {2{1'bx}};
  endcase
end
end: inputs_2

if(inputs_p == 3)
begin: inputs_3
always_comb
begin
  unique casez({ready_i, last_r, reqs_i})
    6'b0_??_???: grants = 3'b000;
    6'b1_??_000: grants = 3'b000;
    6'b1_00_?1?: grants = 3'b010;
    6'b1_00_10?: grants = 3'b100;
    6'b1_00_001: grants = 3'b001;
    6'b1_01_1??: grants = 3'b100;
    6'b1_01_0?1: grants = 3'b001;
    6'b1_01_010: grants = 3'b010;
    6'b1_10_??1: grants = 3'b001;
    6'b1_10_?10: grants = 3'b010;
    6'b1_10_100: grants = 3'b100;
    default: grants = {3{1'bx}};
  endcase
end
end: inputs_3

if(inputs_p == 4)
begin: inputs_4
always_comb
begin
  unique casez({ready_i, last_r, reqs_i})
    7'b0_??_????: grants = 4'b0000;
    7'b1_??_0000: grants = 4'b0000;
    7'b1_00_??1?: grants = 4'b0010;
    7'b1_00_?10?: grants = 4'b0100;
    7'b1_00_100?: grants = 4'b1000;
    7'b1_00_0001: grants = 4'b0001;
    7'b1_01_?1??: grants = 4'b0100;
    7'b1_01_10??: grants = 4'b1000;
    7'b1_01_00?1: grants = 4'b0001;
    7'b1_01_0010: grants = 4'b0010;
    7'b1_10_1???: grants = 4'b1000;
    7'b1_10_0??1: grants = 4'b0001;
    7'b1_10_0?10: grants = 4'b0010;
    7'b1_10_0100: grants = 4'b0100;
    7'b1_11_???1: grants = 4'b0001;
    7'b1_11_??10: grants = 4'b0010;
    7'b1_11_?100: grants = 4'b0100;
    7'b1_11_1000: grants = 4'b1000;
    default: grants = {4{1'bx}};
  endcase
end
end: inputs_4

if(inputs_p == 5)
begin: inputs_5
always_comb
begin
  unique casez({ready_i, last_r, reqs_i})
    9'b0_???_?????: grants = 5'b00000;
    9'b1_???_00000: grants = 5'b00000;
    9'b1_000_???1?: grants = 5'b00010;
    9'b1_000_??10?: grants = 5'b00100;
    9'b1_000_?100?: grants = 5'b01000;
    9'b1_000_1000?: grants = 5'b10000;
    9'b1_000_00001: grants = 5'b00001;
    9'b1_001_??1??: grants = 5'b00100;
    9'b1_001_?10??: grants = 5'b01000;
    9'b1_001_100??: grants = 5'b10000;
    9'b1_001_000?1: grants = 5'b00001;
    9'b1_001_00010: grants = 5'b00010;
    9'b1_010_?1???: grants = 5'b01000;
    9'b1_010_10???: grants = 5'b10000;
    9'b1_010_00??1: grants = 5'b00001;
    9'b1_010_00?10: grants = 5'b00010;
    9'b1_010_00100: grants = 5'b00100;
    9'b1_011_1????: grants = 5'b10000;
    9'b1_011_0???1: grants = 5'b00001;
    9'b1_011_0??10: grants = 5'b00010;
    9'b1_011_0?100: grants = 5'b00100;
    9'b1_011_01000: grants = 5'b01000;
    9'b1_100_????1: grants = 5'b00001;
    9'b1_100_???10: grants = 5'b00010;
    9'b1_100_??100: grants = 5'b00100;
    9'b1_100_?1000: grants = 5'b01000;
    9'b1_100_10000: grants = 5'b10000;
    default: grants = {5{1'bx}};
  endcase
end
end: inputs_5

if(inputs_p == 6)
begin: inputs_6
always_comb
begin
  unique casez({ready_i, last_r, reqs_i})
    10'b0_???_??????: grants = 6'b000000;
    10'b1_???_000000: grants = 6'b000000;
    10'b1_000_????1?: grants = 6'b000010;
    10'b1_000_???10?: grants = 6'b000100;
    10'b1_000_??100?: grants = 6'b001000;
    10'b1_000_?1000?: grants = 6'b010000;
    10'b1_000_10000?: grants = 6'b100000;
    10'b1_000_000001: grants = 6'b000001;
    10'b1_001_???1??: grants = 6'b000100;
    10'b1_001_??10??: grants = 6'b001000;
    10'b1_001_?100??: grants = 6'b010000;
    10'b1_001_1000??: grants = 6'b100000;
    10'b1_001_0000?1: grants = 6'b000001;
    10'b1_001_000010: grants = 6'b000010;
    10'b1_010_??1???: grants = 6'b001000;
    10'b1_010_?10???: grants = 6'b010000;
    10'b1_010_100???: grants = 6'b100000;
    10'b1_010_000??1: grants = 6'b000001;
    10'b1_010_000?10: grants = 6'b000010;
    10'b1_010_000100: grants = 6'b000100;
    10'b1_011_?1????: grants = 6'b010000;
    10'b1_011_10????: grants = 6'b100000;
    10'b1_011_00???1: grants = 6'b000001;
    10'b1_011_00??10: grants = 6'b000010;
    10'b1_011_00?100: grants = 6'b000100;
    10'b1_011_001000: grants = 6'b001000;
    10'b1_100_1?????: grants = 6'b100000;
    10'b1_100_0????1: grants = 6'b000001;
    10'b1_100_0???10: grants = 6'b000010;
    10'b1_100_0??100: grants = 6'b000100;
    10'b1_100_0?1000: grants = 6'b001000;
    10'b1_100_010000: grants = 6'b010000;
    10'b1_101_?????1: grants = 6'b000001;
    10'b1_101_????10: grants = 6'b000010;
    10'b1_101_???100: grants = 6'b000100;
    10'b1_101_??1000: grants = 6'b001000;
    10'b1_101_?10000: grants = 6'b010000;
    10'b1_101_100000: grants = 6'b100000;
    default: grants = {6{1'bx}};
  endcase
end
end: inputs_6

if(inputs_p == 7)
begin: inputs_7
always_comb
begin
  unique casez({ready_i, last_r, reqs_i})
    11'b0_???_???????: grants = 7'b0000000;
    11'b1_???_0000000: grants = 7'b0000000;
    11'b1_000_?????1?: grants = 7'b0000010;
    11'b1_000_????10?: grants = 7'b0000100;
    11'b1_000_???100?: grants = 7'b0001000;
    11'b1_000_??1000?: grants = 7'b0010000;
    11'b1_000_?10000?: grants = 7'b0100000;
    11'b1_000_100000?: grants = 7'b1000000;
    11'b1_000_0000001: grants = 7'b0000001;
    11'b1_001_????1??: grants = 7'b0000100;
    11'b1_001_???10??: grants = 7'b0001000;
    11'b1_001_??100??: grants = 7'b0010000;
    11'b1_001_?1000??: grants = 7'b0100000;
    11'b1_001_10000??: grants = 7'b1000000;
    11'b1_001_00000?1: grants = 7'b0000001;
    11'b1_001_0000010: grants = 7'b0000010;
    11'b1_010_???1???: grants = 7'b0001000;
    11'b1_010_??10???: grants = 7'b0010000;
    11'b1_010_?100???: grants = 7'b0100000;
    11'b1_010_1000???: grants = 7'b1000000;
    11'b1_010_0000??1: grants = 7'b0000001;
    11'b1_010_0000?10: grants = 7'b0000010;
    11'b1_010_0000100: grants = 7'b0000100;
    11'b1_011_??1????: grants = 7'b0010000;
    11'b1_011_?10????: grants = 7'b0100000;
    11'b1_011_100????: grants = 7'b1000000;
    11'b1_011_000???1: grants = 7'b0000001;
    11'b1_011_000??10: grants = 7'b0000010;
    11'b1_011_000?100: grants = 7'b0000100;
    11'b1_011_0001000: grants = 7'b0001000;
    11'b1_100_?1?????: grants = 7'b0100000;
    11'b1_100_10?????: grants = 7'b1000000;
    11'b1_100_00????1: grants = 7'b0000001;
    11'b1_100_00???10: grants = 7'b0000010;
    11'b1_100_00??100: grants = 7'b0000100;
    11'b1_100_00?1000: grants = 7'b0001000;
    11'b1_100_0010000: grants = 7'b0010000;
    11'b1_101_1??????: grants = 7'b1000000;
    11'b1_101_0?????1: grants = 7'b0000001;
    11'b1_101_0????10: grants = 7'b0000010;
    11'b1_101_0???100: grants = 7'b0000100;
    11'b1_101_0??1000: grants = 7'b0001000;
    11'b1_101_0?10000: grants = 7'b0010000;
    11'b1_101_0100000: grants = 7'b0100000;
    11'b1_110_??????1: grants = 7'b0000001;
    11'b1_110_?????10: grants = 7'b0000010;
    11'b1_110_????100: grants = 7'b0000100;
    11'b1_110_???1000: grants = 7'b0001000;
    11'b1_110_??10000: grants = 7'b0010000;
    11'b1_110_?100000: grants = 7'b0100000;
    11'b1_110_1000000: grants = 7'b1000000;
    default: grants = {7{1'bx}};
  endcase
end
end: inputs_7

if(inputs_p == 8)
begin: inputs_8
always_comb
begin
  unique casez({ready_i, last_r, reqs_i})
    12'b0_???_????????: grants = 8'b00000000;
    12'b1_???_00000000: grants = 8'b00000000;
    12'b1_000_??????1?: grants = 8'b00000010;
    12'b1_000_?????10?: grants = 8'b00000100;
    12'b1_000_????100?: grants = 8'b00001000;
    12'b1_000_???1000?: grants = 8'b00010000;
    12'b1_000_??10000?: grants = 8'b00100000;
    12'b1_000_?100000?: grants = 8'b01000000;
    12'b1_000_1000000?: grants = 8'b10000000;
    12'b1_000_00000001: grants = 8'b00000001;
    12'b1_001_?????1??: grants = 8'b00000100;
    12'b1_001_????10??: grants = 8'b00001000;
    12'b1_001_???100??: grants = 8'b00010000;
    12'b1_001_??1000??: grants = 8'b00100000;
    12'b1_001_?10000??: grants = 8'b01000000;
    12'b1_001_100000??: grants = 8'b10000000;
    12'b1_001_000000?1: grants = 8'b00000001;
    12'b1_001_00000010: grants = 8'b00000010;
    12'b1_010_????1???: grants = 8'b00001000;
    12'b1_010_???10???: grants = 8'b00010000;
    12'b1_010_??100???: grants = 8'b00100000;
    12'b1_010_?1000???: grants = 8'b01000000;
    12'b1_010_10000???: grants = 8'b10000000;
    12'b1_010_00000??1: grants = 8'b00000001;
    12'b1_010_00000?10: grants = 8'b00000010;
    12'b1_010_00000100: grants = 8'b00000100;
    12'b1_011_???1????: grants = 8'b00010000;
    12'b1_011_??10????: grants = 8'b00100000;
    12'b1_011_?100????: grants = 8'b01000000;
    12'b1_011_1000????: grants = 8'b10000000;
    12'b1_011_0000???1: grants = 8'b00000001;
    12'b1_011_0000??10: grants = 8'b00000010;
    12'b1_011_0000?100: grants = 8'b00000100;
    12'b1_011_00001000: grants = 8'b00001000;
    12'b1_100_??1?????: grants = 8'b00100000;
    12'b1_100_?10?????: grants = 8'b01000000;
    12'b1_100_100?????: grants = 8'b10000000;
    12'b1_100_000????1: grants = 8'b00000001;
    12'b1_100_000???10: grants = 8'b00000010;
    12'b1_100_000??100: grants = 8'b00000100;
    12'b1_100_000?1000: grants = 8'b00001000;
    12'b1_100_00010000: grants = 8'b00010000;
    12'b1_101_?1??????: grants = 8'b01000000;
    12'b1_101_10??????: grants = 8'b10000000;
    12'b1_101_00?????1: grants = 8'b00000001;
    12'b1_101_00????10: grants = 8'b00000010;
    12'b1_101_00???100: grants = 8'b00000100;
    12'b1_101_00??1000: grants = 8'b00001000;
    12'b1_101_00?10000: grants = 8'b00010000;
    12'b1_101_00100000: grants = 8'b00100000;
    12'b1_110_1???????: grants = 8'b10000000;
    12'b1_110_0??????1: grants = 8'b00000001;
    12'b1_110_0?????10: grants = 8'b00000010;
    12'b1_110_0????100: grants = 8'b00000100;
    12'b1_110_0???1000: grants = 8'b00001000;
    12'b1_110_0??10000: grants = 8'b00010000;
    12'b1_110_0?100000: grants = 8'b00100000;
    12'b1_110_01000000: grants = 8'b01000000;
    12'b1_111_???????1: grants = 8'b00000001;
    12'b1_111_??????10: grants = 8'b00000010;
    12'b1_111_?????100: grants = 8'b00000100;
    12'b1_111_????1000: grants = 8'b00001000;
    12'b1_111_???10000: grants = 8'b00010000;
    12'b1_111_??100000: grants = 8'b00100000;
    12'b1_111_?1000000: grants = 8'b01000000;
    12'b1_111_10000000: grants = 8'b10000000;
    default: grants = {8{1'bx}};
  endcase
end
end: inputs_8

if(inputs_p == 9)
begin: inputs_9
always_comb
begin
  unique casez({ready_i, last_r, reqs_i})
    14'b0_????_?????????: grants = 9'b000000000;
    14'b1_????_000000000: grants = 9'b000000000;
    14'b1_0000_???????1?: grants = 9'b000000010;
    14'b1_0000_??????10?: grants = 9'b000000100;
    14'b1_0000_?????100?: grants = 9'b000001000;
    14'b1_0000_????1000?: grants = 9'b000010000;
    14'b1_0000_???10000?: grants = 9'b000100000;
    14'b1_0000_??100000?: grants = 9'b001000000;
    14'b1_0000_?1000000?: grants = 9'b010000000;
    14'b1_0000_10000000?: grants = 9'b100000000;
    14'b1_0000_000000001: grants = 9'b000000001;
    14'b1_0001_??????1??: grants = 9'b000000100;
    14'b1_0001_?????10??: grants = 9'b000001000;
    14'b1_0001_????100??: grants = 9'b000010000;
    14'b1_0001_???1000??: grants = 9'b000100000;
    14'b1_0001_??10000??: grants = 9'b001000000;
    14'b1_0001_?100000??: grants = 9'b010000000;
    14'b1_0001_1000000??: grants = 9'b100000000;
    14'b1_0001_0000000?1: grants = 9'b000000001;
    14'b1_0001_000000010: grants = 9'b000000010;
    14'b1_0010_?????1???: grants = 9'b000001000;
    14'b1_0010_????10???: grants = 9'b000010000;
    14'b1_0010_???100???: grants = 9'b000100000;
    14'b1_0010_??1000???: grants = 9'b001000000;
    14'b1_0010_?10000???: grants = 9'b010000000;
    14'b1_0010_100000???: grants = 9'b100000000;
    14'b1_0010_000000??1: grants = 9'b000000001;
    14'b1_0010_000000?10: grants = 9'b000000010;
    14'b1_0010_000000100: grants = 9'b000000100;
    14'b1_0011_????1????: grants = 9'b000010000;
    14'b1_0011_???10????: grants = 9'b000100000;
    14'b1_0011_??100????: grants = 9'b001000000;
    14'b1_0011_?1000????: grants = 9'b010000000;
    14'b1_0011_10000????: grants = 9'b100000000;
    14'b1_0011_00000???1: grants = 9'b000000001;
    14'b1_0011_00000??10: grants = 9'b000000010;
    14'b1_0011_00000?100: grants = 9'b000000100;
    14'b1_0011_000001000: grants = 9'b000001000;
    14'b1_0100_???1?????: grants = 9'b000100000;
    14'b1_0100_??10?????: grants = 9'b001000000;
    14'b1_0100_?100?????: grants = 9'b010000000;
    14'b1_0100_1000?????: grants = 9'b100000000;
    14'b1_0100_0000????1: grants = 9'b000000001;
    14'b1_0100_0000???10: grants = 9'b000000010;
    14'b1_0100_0000??100: grants = 9'b000000100;
    14'b1_0100_0000?1000: grants = 9'b000001000;
    14'b1_0100_000010000: grants = 9'b000010000;
    14'b1_0101_??1??????: grants = 9'b001000000;
    14'b1_0101_?10??????: grants = 9'b010000000;
    14'b1_0101_100??????: grants = 9'b100000000;
    14'b1_0101_000?????1: grants = 9'b000000001;
    14'b1_0101_000????10: grants = 9'b000000010;
    14'b1_0101_000???100: grants = 9'b000000100;
    14'b1_0101_000??1000: grants = 9'b000001000;
    14'b1_0101_000?10000: grants = 9'b000010000;
    14'b1_0101_000100000: grants = 9'b000100000;
    14'b1_0110_?1???????: grants = 9'b010000000;
    14'b1_0110_10???????: grants = 9'b100000000;
    14'b1_0110_00??????1: grants = 9'b000000001;
    14'b1_0110_00?????10: grants = 9'b000000010;
    14'b1_0110_00????100: grants = 9'b000000100;
    14'b1_0110_00???1000: grants = 9'b000001000;
    14'b1_0110_00??10000: grants = 9'b000010000;
    14'b1_0110_00?100000: grants = 9'b000100000;
    14'b1_0110_001000000: grants = 9'b001000000;
    14'b1_0111_1????????: grants = 9'b100000000;
    14'b1_0111_0???????1: grants = 9'b000000001;
    14'b1_0111_0??????10: grants = 9'b000000010;
    14'b1_0111_0?????100: grants = 9'b000000100;
    14'b1_0111_0????1000: grants = 9'b000001000;
    14'b1_0111_0???10000: grants = 9'b000010000;
    14'b1_0111_0??100000: grants = 9'b000100000;
    14'b1_0111_0?1000000: grants = 9'b001000000;
    14'b1_0111_010000000: grants = 9'b010000000;
    14'b1_1000_????????1: grants = 9'b000000001;
    14'b1_1000_???????10: grants = 9'b000000010;
    14'b1_1000_??????100: grants = 9'b000000100;
    14'b1_1000_?????1000: grants = 9'b000001000;
    14'b1_1000_????10000: grants = 9'b000010000;
    14'b1_1000_???100000: grants = 9'b000100000;
    14'b1_1000_??1000000: grants = 9'b001000000;
    14'b1_1000_?10000000: grants = 9'b010000000;
    14'b1_1000_100000000: grants = 9'b100000000;
    default: grants = {9{1'bx}};
  endcase
end
end: inputs_9

if(inputs_p == 10)
begin: inputs_10
always_comb
begin
  unique casez({ready_i, last_r, reqs_i})
    15'b0_????_??????????: grants = 10'b0000000000;
    15'b1_????_0000000000: grants = 10'b0000000000;
    15'b1_0000_????????1?: grants = 10'b0000000010;
    15'b1_0000_???????10?: grants = 10'b0000000100;
    15'b1_0000_??????100?: grants = 10'b0000001000;
    15'b1_0000_?????1000?: grants = 10'b0000010000;
    15'b1_0000_????10000?: grants = 10'b0000100000;
    15'b1_0000_???100000?: grants = 10'b0001000000;
    15'b1_0000_??1000000?: grants = 10'b0010000000;
    15'b1_0000_?10000000?: grants = 10'b0100000000;
    15'b1_0000_100000000?: grants = 10'b1000000000;
    15'b1_0000_0000000001: grants = 10'b0000000001;
    15'b1_0001_???????1??: grants = 10'b0000000100;
    15'b1_0001_??????10??: grants = 10'b0000001000;
    15'b1_0001_?????100??: grants = 10'b0000010000;
    15'b1_0001_????1000??: grants = 10'b0000100000;
    15'b1_0001_???10000??: grants = 10'b0001000000;
    15'b1_0001_??100000??: grants = 10'b0010000000;
    15'b1_0001_?1000000??: grants = 10'b0100000000;
    15'b1_0001_10000000??: grants = 10'b1000000000;
    15'b1_0001_00000000?1: grants = 10'b0000000001;
    15'b1_0001_0000000010: grants = 10'b0000000010;
    15'b1_0010_??????1???: grants = 10'b0000001000;
    15'b1_0010_?????10???: grants = 10'b0000010000;
    15'b1_0010_????100???: grants = 10'b0000100000;
    15'b1_0010_???1000???: grants = 10'b0001000000;
    15'b1_0010_??10000???: grants = 10'b0010000000;
    15'b1_0010_?100000???: grants = 10'b0100000000;
    15'b1_0010_1000000???: grants = 10'b1000000000;
    15'b1_0010_0000000??1: grants = 10'b0000000001;
    15'b1_0010_0000000?10: grants = 10'b0000000010;
    15'b1_0010_0000000100: grants = 10'b0000000100;
    15'b1_0011_?????1????: grants = 10'b0000010000;
    15'b1_0011_????10????: grants = 10'b0000100000;
    15'b1_0011_???100????: grants = 10'b0001000000;
    15'b1_0011_??1000????: grants = 10'b0010000000;
    15'b1_0011_?10000????: grants = 10'b0100000000;
    15'b1_0011_100000????: grants = 10'b1000000000;
    15'b1_0011_000000???1: grants = 10'b0000000001;
    15'b1_0011_000000??10: grants = 10'b0000000010;
    15'b1_0011_000000?100: grants = 10'b0000000100;
    15'b1_0011_0000001000: grants = 10'b0000001000;
    15'b1_0100_????1?????: grants = 10'b0000100000;
    15'b1_0100_???10?????: grants = 10'b0001000000;
    15'b1_0100_??100?????: grants = 10'b0010000000;
    15'b1_0100_?1000?????: grants = 10'b0100000000;
    15'b1_0100_10000?????: grants = 10'b1000000000;
    15'b1_0100_00000????1: grants = 10'b0000000001;
    15'b1_0100_00000???10: grants = 10'b0000000010;
    15'b1_0100_00000??100: grants = 10'b0000000100;
    15'b1_0100_00000?1000: grants = 10'b0000001000;
    15'b1_0100_0000010000: grants = 10'b0000010000;
    15'b1_0101_???1??????: grants = 10'b0001000000;
    15'b1_0101_??10??????: grants = 10'b0010000000;
    15'b1_0101_?100??????: grants = 10'b0100000000;
    15'b1_0101_1000??????: grants = 10'b1000000000;
    15'b1_0101_0000?????1: grants = 10'b0000000001;
    15'b1_0101_0000????10: grants = 10'b0000000010;
    15'b1_0101_0000???100: grants = 10'b0000000100;
    15'b1_0101_0000??1000: grants = 10'b0000001000;
    15'b1_0101_0000?10000: grants = 10'b0000010000;
    15'b1_0101_0000100000: grants = 10'b0000100000;
    15'b1_0110_??1???????: grants = 10'b0010000000;
    15'b1_0110_?10???????: grants = 10'b0100000000;
    15'b1_0110_100???????: grants = 10'b1000000000;
    15'b1_0110_000??????1: grants = 10'b0000000001;
    15'b1_0110_000?????10: grants = 10'b0000000010;
    15'b1_0110_000????100: grants = 10'b0000000100;
    15'b1_0110_000???1000: grants = 10'b0000001000;
    15'b1_0110_000??10000: grants = 10'b0000010000;
    15'b1_0110_000?100000: grants = 10'b0000100000;
    15'b1_0110_0001000000: grants = 10'b0001000000;
    15'b1_0111_?1????????: grants = 10'b0100000000;
    15'b1_0111_10????????: grants = 10'b1000000000;
    15'b1_0111_00???????1: grants = 10'b0000000001;
    15'b1_0111_00??????10: grants = 10'b0000000010;
    15'b1_0111_00?????100: grants = 10'b0000000100;
    15'b1_0111_00????1000: grants = 10'b0000001000;
    15'b1_0111_00???10000: grants = 10'b0000010000;
    15'b1_0111_00??100000: grants = 10'b0000100000;
    15'b1_0111_00?1000000: grants = 10'b0001000000;
    15'b1_0111_0010000000: grants = 10'b0010000000;
    15'b1_1000_1?????????: grants = 10'b1000000000;
    15'b1_1000_0????????1: grants = 10'b0000000001;
    15'b1_1000_0???????10: grants = 10'b0000000010;
    15'b1_1000_0??????100: grants = 10'b0000000100;
    15'b1_1000_0?????1000: grants = 10'b0000001000;
    15'b1_1000_0????10000: grants = 10'b0000010000;
    15'b1_1000_0???100000: grants = 10'b0000100000;
    15'b1_1000_0??1000000: grants = 10'b0001000000;
    15'b1_1000_0?10000000: grants = 10'b0010000000;
    15'b1_1000_0100000000: grants = 10'b0100000000;
    15'b1_1001_?????????1: grants = 10'b0000000001;
    15'b1_1001_????????10: grants = 10'b0000000010;
    15'b1_1001_???????100: grants = 10'b0000000100;
    15'b1_1001_??????1000: grants = 10'b0000001000;
    15'b1_1001_?????10000: grants = 10'b0000010000;
    15'b1_1001_????100000: grants = 10'b0000100000;
    15'b1_1001_???1000000: grants = 10'b0001000000;
    15'b1_1001_??10000000: grants = 10'b0010000000;
    15'b1_1001_?100000000: grants = 10'b0100000000;
    15'b1_1001_1000000000: grants = 10'b1000000000;
    default: grants = {10{1'bx}};
  endcase
end
end: inputs_10

if(inputs_p == 1)
  assign last_r = 1'b0;
else
  begin
    bsg_encode_one_hot #(.width_p(inputs_p)
                        ) encoder( .i     (grants)
                                  ,.addr_o(last)
                                  ,.v_o   ()
                                 );

    always_comb
      last_n = (ready_i & (|reqs_i))? last:last_r;
    
    always_ff @(posedge clk_i)
      last_r <= (reset_i)? `BSG_SAFE_CLOG2(inputs_p)'(0):last_n;
  end

endmodule
