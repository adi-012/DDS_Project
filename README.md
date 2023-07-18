# DDS_Project

## Logisim

The file S1-30-Final-final_circuit.circ contains the final circuit design for the project.
The project can be used by simply opening it in Logisim and from there the user can play a 2 player version of Tic Tac Toe.

The players have to press push buttons on the grid they want to mark on their turn. Moves on grids that are already marked are not allowed.

After a player wins the game, or if the game ends in a draw, an LED will display the result

---

## Verilog

The file S1-30-Final-verilogModules.v contains the code for all the modules used in the game.

The file S1-30-Final-verilogTestBench.v is the test bench to run the modules.

In the current iteration of the code, the user has to change the clock pulses in the test bench to play their moves.

The working of the verilog code is modelled exactly after the Logisim circuit design.
