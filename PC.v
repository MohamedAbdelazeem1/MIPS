module program_counter (clk, pcin, pcout,pcout4);

input  clk;
input [31:0] pcin;
output reg [31:0] pcout;
output reg [31:0] pcout4; 
integer flag = 0 ;     
integer file;
integer i;   

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
pcout4 <= pcin + 4;
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


