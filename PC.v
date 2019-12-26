module program_counter (clk, pcin, pcout,pcout4,op_code,move_data);

input  clk;
input [31:0] pcin;
output reg [31:0] pcout;
output reg [31:0] pcout4; 
integer flag = 0 ;     
integer file;
integer i;  
input[5:0]op_code; 
integer flag2;
input[15:0]move_data;
integer memory;

initial
begin
flag2=0;memory=0;
end
always @(posedge clk)
      begin
if (! flag)
begin
pcout = 0 ;
flag <= 1 ;
pcout4 <= pcout + 4;
end 
       
else if(pcin<32764) 
begin 
pcout <= pcin;
if(op_code!=56 || op_code!=57)pcout4 <= pcout + 4;
else if(op_code==56)
begin
if(flag2==0)
begin
pcout4 <= pcout;
flag2=flag2+1;
end
else if(flag2==1)
begin
pcout4 <= pcout+4;
flag2=0;
end
end
else if(op_code==57)
begin
if(move_data>8191*4) //source is io
begin
if(flag2==0)
begin
pcout4 <= pcout;
flag2=flag2+1;
end
else if(flag2==3)
begin
pcout4 <= pcout+4;
flag2=0;
end
end

else if(move_data<=8191*4) //source is memory
begin
memory=1;
if(flag2==0)
begin
pcout4 <= pcout;
flag2=flag2+1;
end
else if(flag2==3)
begin
pcout4 <= pcout+4;
flag2=0;
end
end
end

else if(op_code==58)
begin
if(move_data<=8191*4 && memory)
begin
memory=0;
if(flag2==0)
begin
pcout4 <= pcout;
flag2=flag2+1;
end
else if(flag2==3)
begin
pcout4 <= pcout+4;
flag2=0;
end
end

else if(move_data>8191*4 && memory)
begin
memory=0;
if(flag2==0)
begin
pcout4 <= pcout;
flag2=flag2+1;
end
else if(flag2==1)
begin
pcout4 <= pcout+4;
flag2=0;
end
end

else if(move_data<=8191*4 && !memory)
begin
memory=0;
if(flag2==0)
begin
pcout4 <= pcout;
flag2=flag2+1;
end
else if(flag2==1)
begin
pcout4 <= pcout+4;
flag2=0;
end
end
end
//end of if(op_code==58)


end

else
begin

$stop;
//$finish ;
$monitor ("h555h");
end

end


always @(negedge clk)
begin

if(flag)
begin
file = $fopen("C:\\Users\\Mohammed Emad\\Desktop\\MIPS project\\Printing\\out_pc.txt" , "a+");
//@(posedge clk);
$display("PC =%d",pcout);
$fdisplay(file,"%d\n",pcout);
$fclose(file);
end
end

endmodule


