Continuous Integration for VHDL
======================

The project is developed using the idea of continuous integration. This means that the code is continuously build with the target device and developed in small increments. The main branch is kept in functioning shape at all times and the code is run against tests.

Managing dependencies with test driven development
--------------------------------------------------

I strive for using tests that the development is run against. The project is developed 90% using a test framework called VUnit. This allows evaluating all tests all the time, which keeps the tests in operating state. Making tests, even completely superfluous ones has a great advantage. They keep individual pieces of code individual. Since there is only minimal amount of code build for each test, the dependencies, that is the number of source files needed for using a piece of code is kept to a minimum.

The individual modules are also developed in separate repositories. This allows a minimal number of sources to be reused for many different projects. It also helps to keep the interdependencies to a minimum. It is very difficult to add sources from separate repositories to new ones, thus this helps keeping separate things separate.

I have written about code structures in VHDL that allow for managing dependencies with the language features of VHDL at https://hardwaredescriptions.com/dependency-management/
