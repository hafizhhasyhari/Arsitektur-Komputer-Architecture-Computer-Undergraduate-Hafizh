`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Design Name: RISCV-Pipline CPU
// Module Name: ALU
// Target Devices: Nexys4
// Tool Versions: Vivado 2017.4.1
// Description: ALU unit of RISCV CPU
//////////////////////////////////////////////////////////////////////////////////

`include "Parameters.v"   
module ALU(
    input wire [31:0] Operand1,
    input wire [31:0] Operand2,
    input wire [3:0] AluContrl,
    output reg [31:0] AluOut
    );
endmodule


//Deskripsi fungsi dan antarmuka
//ALU menerima dua operan, melakukan operasi perhitungan yang berbeda sesuai dengan AluContrl yang berbeda, dan mengeluarkan hasil perhitungan ke AluOut
//Tipe AluContrl ditentukan di Parameters.v
//Format yang disarankan:
     //kasus()
     // `TAMBAHKAN: AluOut<=Operand1 + Operand2;
     //.......
     // default: AluOut <= 32'hxxxxxxxx;
     //kasus akhir
//Persyaratan eksperimental
     //Implementasikan modul ALU
