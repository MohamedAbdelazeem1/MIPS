
module dataMemory(readData ,  address , writeData , memRead , memWrite);

input[31:0]address; // kant 5
input [31:0]writeData;
input memRead , memWrite  ; 
output reg [31:0] readData;
integer file ;
integer i;

reg [31:0]memory[0:8191];


/*initial
begin
    // Loading The Memory
$readmemb ("C:\\Users\\Mohammed Emad\\Desktop\\MIPS project\\m.txt", memory);  
   
end */



always @(address) 

begin

if(memRead == 0 && memWrite == 1)
begin 

memory[address/4] <= writeData;  // note dividing by 4

end

else if(memRead == 1 && memWrite == 0)
begin

readData = memory[address/4];   // note dividing by 4

end

else 
begin

readData = 32'hxxxxxxxx;

end

file = $fopen("C:\\Users\\Mohammed Emad\\Desktop\\MIPS project\\Printing\\out_dm.txt.txt","w");
for (i = 0; i<32; i=i+1)
begin
//@(posedge clk);
$fwrite(file,"%b\n",memory[i]);
end
$fclose(file);

end


endmodule
