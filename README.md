# Tank Versus

Mutacion para Left 4 Dead 2 con base Versus, hasta ocho jugadores y
todos los jugadores infectados convertidos en Tanks. No hay comunes ni Witches.
Los Tanks tienen 2000 de vida y un intervalo TankRun de 15 segundos.
Las armas y los objetos conservan el comportamiento de Versus.

## Instalacion

Empaqueta esta carpeta con la herramienta vpk.exe de Left 4 Dead 2.
La raiz del VPK debe contener addoninfo.txt y scripts/.
Instala el VPK en left4dead2/addons/ y activa el addon en el juego.
Para jugar con otras personas, instala el mismo addon en el servidor
y en los clientes.

## Iniciar

En la consola del juego:

```text
map c1m1_hotel main_mutation
```

## Comprobacion en el juego

- Entra al equipo infectado y comprueba que apareces como Tank.
- Comprueba que otro jugador infectado tambien aparece como Tank.
- Muere y comprueba que la siguiente aparicion sigue siendo Tank.
- Verifica que no aparecen comunes ni Witches.
- Completa ambas mitades y cambia de mapa para comprobar puntuacion,
  cambio de equipos y persistencia del modo.

La ejecucion debe validarse dentro de Left 4 Dead 2; este proyecto
no incluye el motor ni un compilador de VScript.
