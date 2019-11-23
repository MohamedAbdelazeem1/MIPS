module resfile(read1,read2,writereg,writedata,write,data1,data2,data2_mem,clk);
input[4:0]read1,read2,writereg;
input[31:0]writedata;
input write,clk;
reg[31:0]rf[0:31];
output [31:0] data1,data2, data2_mem; 
integer file ;
integer i;

initial
begin
rf[0] <= 10 ;  // rs
rf[1] <=20 ;  // rt 
rf[2]<= 45 ; 
rf[16]<= 10;
rf[17]<=6 ; //$zero 
end
/////////////////////
assign data1 = rf[read1];
assign data2 = rf[read2];
assign data2_mem = data2;

/*always @(read1,read2)
begin		
 data1 <= rf[read1];
 data2 <= rf[read2];
 data2_mem <= data2; //for mux after data mem
end
*/
always@(posedge clk)
begin


 if(read1===5'b00000 && read2===5'b00000)
 begin
 file = $fopen("C:\\Users\\Mohammed Emad\\Desktop\\MIPS project\\out.txt","w");
for (i = 0; i<32; i=i+1)
 begin
//@(posedge clk);
$display("rf =%d",rf[i]);
$fwrite(file,"%b\n",rf[i]);
end
$fclose(file);  
end

if (write)
rf[writereg]<=writedata;
end
endmodule

