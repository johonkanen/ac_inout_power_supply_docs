Auxiliary supplies
==================

The power supply is designed to be operated from the line voltage, but the measurements and control and logic circuits need various different voltages to functino correctly. These low power lines are the auxiliary voltages we need to design. The power supply of choise for isolating the primary and secondary side control voltages from the high voltage DC link is discontinuous mode flyback power supply. The flyback requires a minimum amount of parts, since only a transformer, controller and a diode and a capacitor is required and any extra voltage requires just an additional winding to the transformer and a diode + capacitor.

The voltages that are needed by the circuits are 15V for the isolated voltage, +15/-4 for each switch gate, 5V for sigma delta adc:s and the regulated intermediate voltage and then 3.3, 2.5 and 1.2 for the FPGA, 3.3V for the measurement circuits and 1.75 for the op amp references. 

The regulated 5V supply line is obtained from an non-isolated switching regulator. The lower voltage 3.3V is otained from the 5V with a linear regulator.

The 5V could also be an additional secondary from the flyback. For first iteration of the power supply card, the extra fiddling of the getting the 5V secondaries to behave correctly is prevented by using a regulator. The primary and secondary sides have own supplies thus instead of 2 semi well regulated secondaries, we would need 4 semi regulated secondaries. In my experience this would require a day or two of extra testing and iteration with the flyback transformer. 

DCM flyback design
------------------

Since dcm flyback is very common, there are a complete solutions available that does everything using just a single chip. The simplest chip for this that I have come accross is the family of of primary side feedback flyback controllers from Dialog Semiconductor. For this application, I chose IW1818 which allows for approximately a 10W flyback to be built. The IW1818 is a quasi resonant controller and the magic lies in that the feedback is taken from the primary side switched node. The measurement is taken from the reflected voltage of the transformer and this actually is influenced by all secondary voltages. Hence the feedback is taken automatically from all windings.

The IW1818 has very good cross regulation. This was tested in a lab with 200mW and 5W loads at which the primary and secondary were measured between 15.3V and 14.6V with 15 V being the design goal.

Transformer design
------------------

The transformer design for low power DCM flyback is relatively simple. The transformer design is just copied from Fairchild Application Note AN4137.

The design is very simple, just add desired core cross-sectional area and then iterate powers, voltages and the ripple factor to obtain a reasonable design where the windings are close enough for full turns. The design that I used has 52 turn primary, 8 turn secondaries and an off the shelf 250um gapped ee20 core of ef87 ferrite material. The coil formers and border tape are from aliexpress.

The flyback cross regulation is greatly impacted by the winding layout, thus some iteration will be necessary to get it right. In this case the used wires and winding layout was deemed good enough with only a few tests.

The structure of the used transformer is visible in the picture talen during winding. There are 3mm border tapes on both sides of the transformer and the windings are built from 3 strands of awg34 wire and all windings are isolated with 3 layers of capton between them. The wires are not twisted together since the transformer is easier to wind in this way. Note that the ends are not sleeved even though this would be required for off line transformer thus new transformer needs to be built with the ends pulled out of the winding inside proper extra isolation.

.. image:: ../../../20220803_195351.jpg
