
module datatype1;
 integer a; //4 state - 32 bit signed
 int b; //2 state - 32 bit signed
 shortint c; //2 state - 16 bit signed
 longint d; //2 state - 64 bit signed
 logic [7:0] A1; //4-state - unsigned ‘logic’
 logic signed [7:0] sl1; //4-state - signed ‘logic’
 byte bl1; //2-state signed ‘byte’
 reg [7:0] r1; //4-state - unsigned ‘reg’
 initial
 begin
 a = 'h xxzz_ffff; //integer - 4 state - 32 bit signed
 b = -1; //int - 2 state - 32 bit signed
 c = 'h fxfx; //shortint - 2 state - 16 bit signed
 d = 'h ffff_xxxx_ffff_zzzz;
 //longint - 2 state - 64 bit signed
 A1 = -1 ; //signed assignment to unsigned 'logic’
 sl1 = -1; //signed assignment to signed 'logic'
 bl1 = -1; //signed byte
 r1 = 8'b xzxz_0101; //'reg' - unsigned 4-state
 end
  initial
 begin #10;
 $display("a = %h b = %h c = %h d = %h", a, b, c, d);
 $display("A1 = %0d sl1=%0d bl1 = %0d r1 = %b",A1,sl1,bl1,r1);
 #10 $finish(2);
 end
 endmodule

