
module resfile(read1,read2,writereg,writedata,write,data1,data2,data2_mem,clk);
input[4:0]read1,read2,writereg;
input[31:0]writedata;
input write,clk;
reg[31:0]rf[0:31];
output  [31:0] data1,data2, data2_mem; 
integer file ;
integer i;

initial
begin
file=$fopen ("C:\\Users\\Mohammed Emad\\Desktop\\MIPS project/Out.txt");
$fmonitor (file,"%d \n %d\n %d\n %d\n %d",rf[0],rf[1],rf[2],rf[3],rf[4]);
rf[0] <= 10 ;  // rs
rf[1] <=20 ;  // rt 
rf[2]<= 45 ; 
rf[16]<= 10;
rf[17]<=6 ; //$zero 
end
/////////////////////
		
assign data1 = rf[read1];
assign data2 = rf[read2];
assign data2_mem = data2; //for mux after data mem

  always@(posedge clk)
   begin
if (write)
rf[writereg]<=writedata;
end









/*always @ (rf[2])
begin
 $monitor ("%d", rf[2]);
end*/
endmodule

