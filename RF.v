
module resfile(read1,read2,writereg,writedata,write,data1,data2,data2_mem,clk);
input[4:0]read1,read2,writereg;
input[31:0]writedata;
input write,clk;
reg[31:0]rf[0:31];
output  [31:0] data1,data2, data2_mem; 


 integer file ;

initial
begin
rf[0] = 10 ;  // rs
rf[1] <=20 ;  // rt 
rf[2]<= 45 ; 
rf[3]<= 10;
rf[5]<=6 ; //$zero 
end
/////////////////////


		
 		 assign data1 = rf[read1];
 		 assign data2 = rf[read2];
 		 assign data2_mem = data2; //for mux after data mem

	

  always@(posedge clk)
   begin
     if (write)
     rf[writereg]<=writedata;


file = $fopen ("D:\\3rd Computer\\C.O\\Project/Out.txt");
  $fmonitor (file,"data1 is %d \ndata2 is %d \nresult = %d",data1,data2,writedata);

   
    end
/*always @ (rf[2])
begin
 $monitor ("%d", rf[2]);
end*/
endmodule

