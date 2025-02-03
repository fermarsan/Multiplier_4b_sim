# 8-bit Sequential Multiplier Simulation

This example implements a digital 4-bit sequential multiplier simulation on [SimulIDE](https://simulide.com/p/), it is composed by:

- 4-bit parallel input shift-right registers(subcircuits)
- 8-bit parallel input shift-left register (subcircuit)
- 8-bit parallel load register (subcircuit)
- 4-bit zero comparator
- 8-bit adder (subcircuit)
- FSM Finite State Machine as control block (script) [readme file](/FSM/README.md)

![](assets/Multiplier.png)

you can also see this [tutorial](https://youtu.be/PAcU9CNJh7A?si=TVzpL2JlhtzKox_8) (spanish).

This is done as a template in _SimulIDE_, for similar implementations.


## Usage 
You have to copy all the component's folders inside a one in the user data folder, for instance `~/User_data/test`and associate it in Simulide.
You can see how to do this in the official SimulIDE's Tutorials:

- [User data folder SimulIDE 1.1.0](https://www.youtube.com/watch?v=pAU7fdUWCqs)

- [Crear Componentes SimulIDE 1.1.0 ](https://www.youtube.com/watch?v=LBknR6y5Qho) (Spanish)