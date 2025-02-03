# Simulación de multiplicador secuencial de 8 bits

Este ejemplo implementa una simulación de multiplicador secuencial digital de 4 bits en [SimulIDE](https://simulide.com/p/), está compuesto por:

- Registro de desplazamiento a la derecha de entrada paralela de 4 bits (subcircuito)
- Registro de desplazamiento a la izquierda de entrada paralela de 8 bits (subcircuito)
- Registro de carga paralela de 8 bits (subcircuito)
- Comparador de cero de 4 bits
- Sumador de 8 bits (subcircuito)
- Máquina de estados finitos FSM como bloque de control (script) [archivo readme](/FSM/README.md)

![](assets/Multiplier.png)

También puedes ver este [tutorial](https://youtu.be/PAcU9CNJh7A?si=TVzpL2JlhtzKox_8) (español).

Esto se hace como plantilla en _SimulIDE_, para implementaciones similares.

## Uso
Tienes que copiar todas las carpetas de los componentes dentro de una en la carpeta de datos de usuario, por ejemplo `~/User_data/test` y asociarla en Simulide.
Puedes ver cómo hacer esto en los Tutoriales oficiales de SimulIDE:

- [Carpeta de datos de usuario SimulIDE 1.1.0](https://www.youtube.com/watch?v=pAU7fdUWCqs)

- [Crear Componentes SimulIDE 1.1.0 ](https://www.youtube.com/watch?v=LBknR6y5Qho)