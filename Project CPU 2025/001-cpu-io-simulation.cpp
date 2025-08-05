#include <stdio.h> #include <stdlib.h>

#define MEM_SIZE 256

// Memory dan Register unsigned char memory[MEM_SIZE]; unsigned char ACC = 0; unsigned char PC = 0; unsigned char IR = 0; unsigned char MAR = 0; unsigned char MBR = 0;

// Set instruksi sederhana (ISA) enum INSTRUCTION_SET { HLT = 0x00, LOAD = 0x01, STORE = 0x02, ADD = 0x03, IN = 0x04, OUT = 0x05 };

// Fungsi untuk memuat program ke memori void load_program() { // Program: input → add 5 → output → halt memory[0x00] = IN; memory[0x01] = ADD; memory[0x02] = 0x10;      // alamat nilai 5 memory[0x03] = OUT; memory[0x04] = HLT;

// Data
memory[0x10] = 5;         // nilai untuk ditambahkan

}

// Fungsi untuk mengeksekusi instruksi void execute() { while (1) { IR = memory[PC++]; // Fetch instruksi

switch (IR) {
        case HLT:
            printf("\n[HLT] Program dihentikan.\n");
            return;

        case LOAD:
            MAR = memory[PC++];
            MBR = memory[MAR];
            ACC = MBR;
            printf("[LOAD] ACC <= Mem[0x%02X] = %d\n", MAR, ACC);
            break;

        case STORE:
            MAR = memory[PC++];
            memory[MAR] = ACC;
            printf("[STORE] Mem[0x%02X] <= ACC = %d\n", MAR, ACC);
            break;

        case ADD:
            MAR = memory[PC++];
            MBR = memory[MAR];
            ACC += MBR;
            printf("[ADD] ACC += Mem[0x%02X] = %d => ACC = %d\n", MAR, MBR, ACC);
            break;

        case IN:
            printf("[IN] Masukkan nilai input: ");
            scanf("%hhu", &ACC);
            printf("[IN] ACC <= %d\n", ACC);
            break;

        case OUT:
            printf("[OUT] Nilai ACC: %d\n", ACC);
            break;

        default:
            printf("[ERROR] Instruksi tidak dikenal: 0x%02X\n", IR);
            return;
    }
}

}

int main() { printf("=== Simulasi Mini Sistem Komputer ===\n"); load_program(); execute(); return 0; }

