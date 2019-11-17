module instruction_memory ( pc_address,ir );

input [31:0] pc_address;

output reg [31:0] ir ;



reg[31:0]Imem[0:8191]; // The Instrution Memory Itself

initial
begin
    // Loading The Memory
$readmemb ("C:\\Users\\Mohammed Emad\\Desktop\\MIPS project\\m.txt", Imem);  // The Input File (Assembly Converted To Binary)
   
end 

always @(pc_address)
begin
		
ir = Imem[pc_address/4]; // lazem 22sem 3la 4
end


endmodule 

