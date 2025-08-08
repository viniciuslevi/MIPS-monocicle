# MIPS Monocycle

Este projeto implementa um processador MIPS de ciclo único (monociclo) utilizando VHDL. O objetivo é simular e estudar a arquitetura MIPS, permitindo a execução de instruções básicas em um ambiente de simulação.

## Estrutura do Projeto

- **adder32.vhd**: Somador de 32 bits.
- **alu.vhd**: Unidade Lógica e Aritmética (ALU).
- **alucontrol.vhd**: Unidade de controle da ALU.
- **control.vhd**: Unidade de controle principal do processador.
- **decode.vhd**: Estágio de decodificação de instruções.
- **design.vhd**: Top-level do processador.
- **execute.vhd**: Estágio de execução.
- **fetch.vhd**: Estágio de busca de instruções.
- **memoryAccess.vhd**: Estágio de acesso à memória.
- **mux232.vhd, mux25.vhd, mux332.vhd, mux35.vhd**: Multiplexadores utilizados no datapath.
- **ram.vhd**: Memória RAM.
- **registers.vhd**: Banco de registradores.
- **rom.vhd**: Memória ROM para instruções.
- **rreg32.vhd**: Registrador de 32 bits.
- **testbench.vhd**: Testbench para simulação do processador.
- **writeback.vhd**: Estágio de escrita de volta.
- **run.sh**: Script para automatizar a simulação.
- **dataset.asdb, example.out**: Exemplos de dados e saídas de simulação.

## Como Simular

1. Certifique-se de ter um simulador VHDL instalado (por exemplo, GHDL).
2. Utilize o script `run.sh` para compilar e rodar a simulação:

```bash
./run.sh
```

3. Analise os resultados gerados nos arquivos de saída.

## Objetivo

O projeto visa facilitar o estudo da arquitetura MIPS, permitindo a visualização do funcionamento interno de um processador monociclo, incluindo o datapath e o controle.

## Créditos

Desenvolvido por Vinícius Levi e colaboradores.
