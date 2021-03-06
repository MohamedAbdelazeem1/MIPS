module instruction_memory (pc_address,ir );

input [31:0] pc_address;
output reg [31:0] ir ;
integer i;
integer flag;

reg[31:0]Imem[0:8191]; // The Instrution Memory Itself
initial
begin
flag=0;
for(i=0;i<=8191;i=i+1)
begin
Imem[i]=32'bx;
end
// Loading The Memory
$readmemb ("C:\\Users\\Mohammed Emad\\Desktop\\Assembler_dma\\machine_code.txt", Imem);  // The Input File (Assembly Converted To Binary)
   
end 

always @(pc_address)
begin

ir = Imem[pc_address/4]; // lazem 22sem 3la 4

if(flag)
$finish;

if(ir == 32'hffffffff)
flag=1;

end


endmodule 

