Auxiliary supplies
======================

Since the power supply is designed to be operated from the line voltage, we need to design a low power supply that powers the FPGA, measuremen circuitry and control circuitry. The power supply of choise for this is discontinuous mode flyback power supply. The flyback requires a minimum amount of parts, since only a transformer, controller and a diode and a capacitor is required for any additional voltage.

The regulated 5V supply line is obtained from an non-isolated power supply. The primary and secondary sides have own supplies. The lower voltage 3.3V is otained from the 5V with a linear supply.

DCM flyback design
------------------

Since dcm flyback is very common, there are a complete solutions available that does everything using just a single chip. The simplest chip for this that I have come accross is the family of of primary side feedback flyback controllers from Dialog Semiconductor. For this application, I chose IW1818 which allows for approximately a 10W flyback to be built. The IW1818 is a quasi resonant controller and the magic lies in that the feedback is taken from the primary side switched node.

The IW1818 has very good cross regulation. This was tested in a lab with 200mW and 5W loads at which the 
