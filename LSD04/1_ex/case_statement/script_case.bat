cd C:\Users\mathe\OneDrive\Documentos\PERIODO\LAB_SD\LSD04\1_ex\case_statement
:: Modifique as linhas seguintes para incluir os arquivos .vhd que deseja analisar (compilar).
ghdl -a case_statement.vhd
ghdl -a tb_case.vhd
:: Modifique a linha a seguir com o nome da entidade top level do arquivo testbench que você deseja simular.
ghdl -e tb_case
:: Modifique a linha a seguir com o nome do arquivo testbench que você deseja simular e o nome do arquivo .vcd que deseja gerar.
ghdl -r tb_case --vcd=tb_case.vcd
:: Modifique a linha a seguir com o nome do arquivo .vcd que deseja visualizar com o GTKWAVE.
gtkwave -f tb_case.vcd  --script=gtkwave_print.tcl
:Done
