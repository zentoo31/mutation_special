# Tank Versus

Mutacion para Left 4 Dead 2 con base Versus, hasta ocho jugadores y
todos los jugadores infectados convertidos en Tanks. Hay hasta 15 comunes,
con apariencia de payaso y salud comun predeterminada. Las Witches siguen
activas. Los Tanks tienen 1000 de vida (aproximadamente dos
golpes de melee, asumiendo 500 de daño por golpe) y un intervalo TankRun de
15 segundos. No aparecen armas de fuego; los spawns de botiquines se convierten
en píldoras que dan 30 de vida temporal.

## Instalacion

Empaqueta esta carpeta con la herramienta vpk.exe de Left 4 Dead 2.
La raiz del VPK debe contener addoninfo.txt, la carpeta modes y
scripts/vscripts. Marca tanto Mutation como Script en addoninfo.txt.
Instala el VPK en left4dead2/addons/ y activa el addon en el juego.
Para jugar con otras personas, instala el mismo addon en el servidor
y en los clientes.

## Iniciar

La mutacion Tank Versus:

```text
map c1m1_hotel tankversus
```

`tankversus` usa como base la mutacion oficial Versus `mutation19` (Taaannnk!!)
para heredar sus reglas Versus, y carga un VScript con el mismo nombre que el
modo. No cambies esta variante, que se conserva como la version funcional.

Para probar una lobby con herencia directa de Versus, usa la variante separada
`main_mutation`:

```text
map c1m1_hotel main_mutation
```

En el selector aparece como `Tank Versus - Prueba base Versus`. Esta copia usa
las mismas reglas, pero su descriptor hereda directamente de `versus`.

El modo experimental independiente Solo Deagle (base `none`, no Versus ni
Co-op) se inicia con:

```text
map c1m1_hotel deagle_only
```

Este modo convierte las apariciones de armas de fuego del mapa en pistolas
magnum/Desert Eagle y cambia la pistola secundaria inicial de los supervivientes
por una magnum.

## Comprobacion en el juego

Para probar Solo Deagle, la consola debe mostrar
`DEAGLE_ONLY_VSCRIPT_LOADED`. Comprueba que el arma secundaria inicial sea
magnum y que los spawns de armas del mapa se conviertan en magnums.

Tank Versus conserva su prueba independiente: infectados Tank, hasta 15 comunes
con modelo de payaso y salud normal, Witches activas, armas melee y píldoras.
Las armas de fuego se bloquean en el
mapa y el equipo inicial sustituye las armas por melee. Los bots del equipo
infectado solo pueden completar las cuatro plazas del equipo: con cuatro
jugadores infectados no queda capacidad para Tanks bots.

La ejecucion debe validarse dentro de Left 4 Dead 2; este proyecto
no incluye el motor ni un compilador de VScript.
