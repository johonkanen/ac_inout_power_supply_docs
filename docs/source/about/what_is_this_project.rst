What is this project?
=====================

This project is a bidirectional lab power supply. The idea is to have a programmable supply with which I can relatively easily develop grid connected devices, or other power supplies. The bidirectionality allows the power supply to work as either a load or a source.

The power supply is designed with a grid side inverter and a load side inverter and these are galvanically isolated with a dual active bridge DC/DC converter.

The converter is controlled using a FPGA. The use of an FPGA greatly simplifies the hardware design, since we can use any adcs for measurements and control and we can effectively route the digital lines in the programmable chip it self, thus we can select IO:s based on what is simple to route. Also the gate power supplies can be controlled with the FPGA.
