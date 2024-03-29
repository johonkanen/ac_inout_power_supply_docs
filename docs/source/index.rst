Welcome to bidirectional power supply build documentation pages!
================================================================

.. image:: ../../20220811_182755.jpg

These are documentation pages and build log for fully FPGA controlled bidrectional power supply. The code can be found in github at 

https://github.com/johonkanen/ac_in_ac_out_lab_power_supply

The VHDL code for this project is built using hVHDL libraries. The hVHDL libraries and high level methods allow the code to be written at high level and the methods allow for very fast development and continuously improvement and reuse of existing code. The hVHDL project is open source and can be found in Github


https://github.com/hVHDL


I have written about the design methods and some of the math behind this power supply at my home page https://hardwaredescriptions.com

I have opened a discussions page in the github where you can write any comments, questions or general ideas. If there is some other platform better suited for this you can write a comment in the discussions page.
https://github.com/johonkanen/ac_inout_power_supply_docs/discussions

The pcb files are found on the documentation github page at https://github.com/johonkanen/ac_inout_power_supply_docs/tree/main/pcb_files

The pcbs are designed using Proteus Professional, which has a fully featured demo version with which you can view the schematics. The demo version can be downloaded for free at https://www.labcenter.com/downloads/

.. toctree::
    :caption: About
    :hidden:

    about/continuous_integration.rst
    about/what_is_this_project.rst

.. toctree::
    :caption: Why FPGA/VHDL for power electronics
    :hidden:

    fpga_for_power_electronics_control/test_driven_development_for_io.rst

.. toctree::
    :caption: Auxiliary supplies
    :hidden:

    auxiliary_supplies/dcm_flyback_auxiliary_supply.rst
    auxiliary_supplies/gate_drive_power_supply/gate_drive_power_supply.rst

.. toctree::
    :caption: Control hardware
    :hidden:

    FPGA_control_card/control_card.rst
