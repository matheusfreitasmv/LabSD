cd C:\Users\mathe\OneDrive\Documentos\PERIODO\LAB_SD\LSD04\1_ex\if_statement
:: Modifique as linhas seguintes para incluir os arquivos .vhd que deseja analisar (compilar).
ghdl -a ex1.vhd
ghdl -a tb_ex_1.vhd
:: Modifique a linha a seguir com o nome da entidade top level do arquivo testbench que você deseja simular.
ghdl -e tb_ex_1
:: Modifique a linha a seguir com o nome do arquivo testbench que você deseja simular e o nome do arquivo .vcd que deseja gerar.
ghdl -r tb_ex_1 --vcd=tb_ex_1.vcd
:: Modifique a linha a seguir com o nome do arquivo .vcd que deseja visualizar com o GTKWAVE.
gtkwave -f tb_ex_1.vcd  --script=gtkwave_print.tcl
:Done
