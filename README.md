[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/Jomd37hb)
# TP Integrador - Paradigma Lógico 2022

Integrantes:

- **Eitan Wajsberg**
- **Bryan A. Battagliese**
- **Nehuen Balian Amaros**
- **Franco N. Magnaghi**
- **Lucas Surdo**


## Consignas

Este trabajo, a diferencia de los anteriores, tiene consignas abiertas con la intención de que tomen decisiones respecto a los predicados a desarrollar. También tiene las dimensiones y complejidad de un parcial, con lo cual debería servir para prepararse para lo que se viene :muscle:

Pueden encontrar el enunciado del trabajo práctico [acá](https://docs.google.com/document/d/19xuKpMKmBreL_z-iW3Bv1Xyz6OpbwAe0xJLAMKiETWU/edit).

Se espera que **desarrollen** lo indicado en cada punto en el archivo `src/tp.pl`, luego del código provisto. También se espera que incluyan, dentro del mismo archivo, **las pruebas** sobre los predicados que resuelven los distintos puntos del TP que permitan validar el comportamiento del programa con la base de conocimientos provista y aquellos agregados que consideren apropiados :mag_right:.

> Queda a criterio del equipo el desarrollo de las pruebas que permitan verificar la funcionalidad de cada punto de forma aislada, así como los datos a incorporar a la base de conocimientos que les permitan probar adecuadamente.

Y no olviden editar este `README` con los nombres de cada integrante :smile:

## Modalidad de trabajo

Para arrancar, cada integrante debería clonarse el repositorio ejecutando el comando `git clone urlParaClonarElRepo`, de modo que puedan trabajar tanto de forma sincrónica como asincrónica (ver más abajo).

Al igual que para los trabajos prácticos anteriores, se recomienda dar pasos chicos: implementar lo que se pide para un punto, probar lo desarrollado para validar que funciona correctamente y subir esos cambios.

Al igual que para los trabajos prácticos anteriores, se recomienda dar pasos chicos: implementar lo que se pide para un punto, y a la par probar lo desarrollado para validar que funciona correctamente.

Si tienen dudas, la idea es usar el canal privado de Discord que fue creado para su grupo. También pueden usar ese mismo canal para cualquier comunicación entre ustedes.

> 🔈 Para sesiones de trabajo sincrónicas, también encontraran en el server de Discord un canal de voz para su grupo, para facilitarles un punto de encuentro.

Y no olviden de abrir un issue para avisar que entregaron el trabajo práctico, así como también crear un tag para que se dispare la corrida de pruebas en el servidor.

### Testeo :heavy_check_mark:

Para este trabajo **no se proveen pruebas automáticas** que verifiquen los resultados de los predicados a desarrollar en cada punto, para no comprometer la libertad para diseñar la solución. Si bien se provee una base de conocimientos inicial con los predicados que se detallan en el enunciado y se explican algunos ejemplos de información que debe poder representarse, se espera que agreguen suficiente información relevante para poder verificar la funcionalidad pedida y desarrollen las pruebas automáticas necesarias para cubrir los distintos escenarios en `src/tp.pl`.

Recuerden que para probar el trabajo manualmente desde la consola, alcanza con correr el comando `swipl src/tp.pl` sobre la raíz del proyecto y ejecutar las consultas correspondientes en la consola de Prolog.

Para correr los tests alcanza con ejecutar `run_tests.` en la consola de Prolog. También se correrán automáticamente al recargar la solución con el comando `make.`

> Por simplicidad, no es necesario que desarrollen pruebas automáticas que verifiquen que los predicados que desarrollen sean inversibles. Sin embargo sí es importante que se aseguren al menos mediante consultas en la consola de Prolog que los predicados que se espera que sean inversibles efectivamente lo sean.

En el archivo `src/tp.pl` se incluyen algunos tests automáticos de referencia a modo de guía. Para más información sobre testeo con PLUnit, pueden complementar con este [video](https://youtu.be/8Llph7eV8rs).

### Recomendaciones para trabajo grupal :busts_in_silhouette:

Si bien no hay una única forma para trabajar en grupo sobre una misma base de código, la recomendación es que se coordinen para arrancar trabajando de forma **sincrónica** y aprovechen la extensión **Live Share** del VSCode, de forma que puedan tomar decisiones conjuntas y avanzar a la par.

Para trabajo **asincrónico**, alcanza con que cada integrante tenga clonado el repositorio y **antes** de trabajar sobre un cambio, se asegure de tener su repo local con el **código actualizado** corriendo el comando `git pull` sobre la raíz del proyecto.

En la medida en la que avancen sobre el ejercicio, recuerden subir su solución a GitHub con los comandos:

```
git add .
git commit -m "Mensaje que explica los cambios"
git push
```

Eviten empezar un cambio y dejarlo sin subir, de lo contrario es muy probable que se produzcan [**conflictos**](https://www.youtube.com/watch?v=sKcN7cWFniw&list=PL2xYJ49ov_ddydw7wvncxMBzB3wpqPV0u&index=7) con lo que haga la otra persona :scream:

Siempre es mejor hacer commits chicos para cambios puntuales y pushear seguido, y más aún trabajando en equipo. Si necesitan ayuda, contacten a sus tutores.

### Uso de LiveShare :rocket:

Para trabajar con Live Share, una persona del equipo deberá:

- abrir el VSCode sobre la carpeta del proyecto
- crear una sesión compartida usando la extensión Live Share y compartirle el link para sumarse a esa sesión al resto (les va a pedir loguearse, para eso usan su id de GitHub y listo).

Esta extensión permite que todas las personas que se sumen a la sesión puedan editar al mismo tiempo el código del proyecto, como si fuera un google doc pero con todos los features del entorno de desarrollo que se armaron para Prolog.

> Una vez iniciada la sesión, aparecerá el menú Live Share a la izquierda del VSCode. Allí pueden encontrar opciones útiles, incluyendo compartir la terminal en modo editable para el resto del equipo en vez de ser sólo lectura.
>
> Para más información ver: https://code.visualstudio.com/learn/collaboration/live-share
