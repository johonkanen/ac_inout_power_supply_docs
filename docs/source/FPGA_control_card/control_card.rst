FPGA control card
=================

The system is controlled using a Cyclone 10 LP FPGA. The control card is placed in the secondary side of the power supply. The control card has connections for a serial connection, gigabit ethernet for the main communications, a single row header that can be used for a LCD display and the 5V and main connectors between control card and the power card. The power card has primary side measurements and the underside of the control card has the secondary measurements. All currents are measured using isolated sigma delta modulators as these can be operated from the gate drive power supplies and can be directly interfaced to a shunt resistor. The use of a resistor in place of a dedicated current transducer is much simpler, cheaper and require a lot less board space.

Interestingly the first revision of the power supply board has a bug in that the main connector is mirrored. However, since an FPGA is used here, the fix is simply to reroute the IO:s in the build script and swap 4 pins due to opposing ground connection.

.. image:: ../../../../20220808_160759.jpg

ADS7056 AD converter
--------------------

The ad converter that is used on the control card are texas instruments ADS7056 type. These are SAR adc with internal sample and hold circuitry and it allows up to 2.5 MHz sample rate. The ADC is controlled with SPI, which makes it simple to operate. The sample ADC is used for sampling multiple signals, hence an analog multiplexer is used to switch between the adc inputs.

Ethernet PHY
------------

The ethernet chip is PEF707 as this is the same as is used with the cyclone 10 lp evaluation kit. The Ethernet phy has an onboard switched mode controller that makes powering the phy very simple. 

