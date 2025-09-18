module datatype1;
 real real1, real2, real3;
 integer i1;
 bit [63:0] bit1;
 initial begin
 real1 = 123.45;
 i1 = $rtoi(real1);
 real2 = $itor(i1);
 bit1 = $realtobits ( real1);
 real3 = $bitstoreal(bit1);
 end
 initial begin
 #10;
 $display("real1 = %f real2 = %f i1=%0d",real1,real2,i1);
 $display("bit1 = %b real3=%f",bit1,real3);
 #10 $finish(2);
 end
 endmodule

***output***
# KERNEL: real1 = 123.450000 real2 = 123.000000 i1=123
# KERNEL: bit1 = 0100000001011110110111001100110011001100110011001100110011001101 real3=123.450000

***theory****
real1 stores a floating-point value.

$rtoi converts real → integer (truncates).

$itor converts integer → real.

$realtobits gets the raw IEEE 754 binary of a real.

$realtobits(real_value) returns a 64-bit bit[63:0] where the bits are the IEEE-754 binary64 (double-precision) encoding of the real. In that 64 bits:

bit 63 (MSB) = sign (0 => +, 1 => -)

bits 62:52 (11 bits) = exponent field (biased by 1023)

bits 51:0 (52 bits) = fraction/significand (also called mantissa without the implicit leading 1)

The numeric value (for a normalized number) is:
  value = (-1)^sign × 2^(exponent_field - 1023) × (1 + fraction/2^52)

$bitstoreal interprets that binary back as a real.
