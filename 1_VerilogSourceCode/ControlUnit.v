`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Engineer: Hafizh H Asyhari
// Nama Desain: CPU RISCV-Pipline
// Nama Modul: Unit Kontrol
// Perangkat Target: Nexys4
// Versi Alat: Vivado 2017.4.1
// Deskripsi: Dekoder Instruksi RISC-V
//////////////////////////////////////////////////////////////////////////////////
`include "Parameters.v"   
module ControlUnit(
    input wire [6:0] Op,
    input wire [2:0] Fn3,
    input wire [6:0] Fn7,
    output wire JalD,
    output wire JalrD,
    output reg [2:0] RegWriteD,
    output wire MemToRegD,
    output reg [3:0] MemWriteD,
    output wire LoadNpcD,
    output reg [1:0] RegReadD,
    output reg [2:0] BranchTypeD,
    output reg [3:0] AluContrlD,
    output wire [1:0] AluSrc2D,
    output wire AluSrc1D,
    output reg [2:0] ImmType        
    );
endmodule


//Deskripsi fungsi
     //ControlUnit adalah dekoder instruksi CPU ini, rangkaian logika kombinasional
//memasuki
     // Op adalah bagian opcode dari instruksi
     // Fn3 adalah bagian func3 dari instruksi
     // Fn7 adalah bagian func7 dari instruksi
//Keluaran
     // JalD==1 menunjukkan bahwa instruksi Jal mencapai tahap decoding ID
     // JalrD==1 menunjukkan bahwa instruksi Jalr mencapai tahap decoding ID
     // RegWriteD mewakili mode penulisan register yang sesuai dengan instruksi di tahap ID. Semua mode ditentukan di Parameters.v
     // MemToRegD==1 berarti instruksi pada tahap ID perlu menulis nilai yang dibaca dari memori data ke dalam register.
     // MemWriteD totalnya 4 bit, menggunakan format kode one-hot. Untuk kata 32-bit di memori data, ditulis dengan byte. MemWriteD=0001 berarti hanya menulis 1 byte terendah, yang mirip dengan antarmuka xilinx. bram.
     // LoadNpcD==1 berarti mengeluarkan NextPC ke ResultM
     // RegReadD[1]==1 berarti nilai register yang terkait dengan A1 digunakan, RegReadD[0]==1 berarti nilai register yang terkait dengan A2 digunakan, dan digunakan untuk pemrosesan penerusan.
     // BranchTypeD mewakili tipe cabang yang berbeda, semua tipe didefinisikan di Parameters.v
     // AluContrlD mewakili fungsi penghitungan ALU yang berbeda, semua tipe ditentukan di Parameters.v
     // AluSrc2D mewakili pemilihan sumber input Alu 2
     // AluSrc1D mewakili pemilihan sumber input Alu 1
     //ImmType mewakili format langsung dari instruksi, semua tipe didefinisikan di Parameters.v
//Persyaratan eksperimental
     //Implementasikan modul ControlUnit
