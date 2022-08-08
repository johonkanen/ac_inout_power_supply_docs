Gate drive power supply
=======================

The gate drivers also need to have a distinct power supplies. The main design goal of a gate drive power is that it is simple and small and provides voltages for the SiC gates. The accuracy for this does not need to be perfect, so anything between 14.5 and 16 V should be sufficient at this point. I have designed two versions of the gate drive power supply. One is build using a asymmetric flyback and the other is just basic flyback with a single transistor and rcd snubber. The gate drive power is operated open loop thus it is important that the supply has good open loop regulation. In my experience, the asymmetric flyback does this well enough. I have used an ixys IXDD609 gate driver as the power stage to drive the transformer. Since the secondaries are the same for both, the flyback and asymmetric flyback, I also ordered boards for the flyback.

The partially assembled boards are visible in the Figure below.

.. image:: ../../../../20220808_160759.jpg

The gate power supplies have an EE10 transformers for each board and every board creates voltages for one half bridge. Additionally one of the pins is just the raw 15V voltage, which is used for powering the isolated ADC that is used to measure the inductor currents.
