`default_nettype none

`timescale 1ns / 1ps

module full_adder(
    input m,
    input q,
    input c,
    output carry_out,
    output sum
    );
    
assign and1 = c&q;
assign and2 = c&m;
assign and3 = q&m;
assign carry_out = and1 | and2 | and3;
assign sum = m ^ q ^ c;

    
endmodule


module array_mult_structural(
    input [3:0] m,
    input [3:0] q,
    output [7:0] p
    );
    
assign int_sig1 = m[1] & q[0];
assign int_sig2 = m[0] & q[1];
assign int_sig3 = m[2] & q[0];
assign int_sig4 = m[1] & q[1];
assign int_sig5 = m[0] & q[2];
assign int_sig6 = m[3] & q[0];
assign int_sig7 = m[2] & q[1];
assign int_sig8 = m[1] & q[2];
assign int_sig9 = m[0] & q[3];
assign int_sig10 = m[3] & q[1];
assign int_sig11 = m[2] & q[2];
assign int_sig12 = m[1] & q[3];
assign int_sig13 = m[3] & q[2];
assign int_sig14 = m[2] & q[3];
assign int_sig15 = m[3] & q[3];

full_adder inst1_1 (int_sig1,int_sig2,0, carry_out1, sum1);
full_adder inst1_2 (int_sig3,int_sig4,carry_out1, carry_out2, sum2);
full_adder inst2_1 (int_sig5,sum2, 0, carry_out3, sum3);
full_adder inst1_3 (int_sig6,int_sig7,carry_out2, carry_out4, sum4);
full_adder inst2_2 (sum4,int_sig8,carry_out3, carry_out5, sum5);
full_adder inst3_1 (sum5,int_sig9,0,carry_out6, sum6);
full_adder inst1_4 (int_sig10,0,carry_out4,carry_out7,sum7);
full_adder inst2_3 (sum7,int_sig11,carry_out5,carry_out8,sum8);
full_adder inst3_2 (sum8,int_sig12,carry_out6,carry_out9,sum9);
full_adder inst2_4 (carry_out7,int_sig13,carry_out8,carry_out10,sum10);
full_adder inst3_3 (sum10,int_sig14,carry_out9,carry_out11,sum11);
full_adder inst3_4 (carry_out10,int_sig15,carry_out11,carry_out12,sum12);

assign p[0] = m[0] & q[0];
assign p[1] = sum1;
assign p[2] = sum3;
assign p[3] = sum6;
assign p[4] = sum9;
assign p[5] = sum11;
assign p[6] = sum12;
assign p[7] = carry_out12;
    
endmodule

