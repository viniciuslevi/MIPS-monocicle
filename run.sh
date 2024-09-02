cd /home/runner
export PATH=/usr/bin:/bin:/tool/pandora64/bin:/usr/share/Riviera-PRO/bin:/usr/local/bin
export RIVIERA_HOME=/usr/share/Riviera-PRO
export CPLUS_INCLUDE_PATH=/usr/share/Riviera-PRO/interfaces/include
export ALDEC_LICENSE_FILE=27009@10.116.0.5
export HOME=/home/runner
vlib work && vcom '-2019' '-o' writeback.vhd memoryAccess.vhd alu.vhd alucontrol.vhd registers.vhd decode.vhd control.vhd mux25.vhd fetch.vhd rom.vhd adder32.vhd rreg32.vhd mux232.vhd ram.vhd execute.vhd mux332.vhd mux35.vhd design.vhd testbench.vhd  && vsim -c -do "vsim testbench; run -all; exit"  ; echo 'Creating result.zip...' && zip -r /tmp/tmp_zip_file_123play.zip . && mv /tmp/tmp_zip_file_123play.zip result.zip