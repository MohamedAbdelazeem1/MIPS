
module resfile(read1,read2,writereg,writedata,write,data1,data2,data2_mem,clk);
input[4:0]read1,read2,writereg;
input[31:0]writedata;
input write,clk;
reg[31:0]rf[0:31];
output[31:0] data1,data2, data2_mem;

// forcing rf[0] and rf[1]
 

initial
begin
rf[0] =0 ;  // $zero = 0;
end
/////////////////////



 assign data1 = rf[read1];
 assign data2 = rf[read2];
 assign data2_mem = data2;

  always@(posedge clk)
   begin
     if (write)
     rf[writereg]<=writedata;
   
    end
always @ (*)
begin
$monitor ("rf[4] = 6 ///%d   rf[5] = 3 ///%d   rf[8] = 8 ///%d",rf[4],rf[5],rf[8]);

end
endmodule

