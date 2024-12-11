
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Base de conocimientos inicial
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% objetivo(Proyecto, Objetivo, TareaARealizar)
objetivo(higiene, almejas, recolectarMaterial(playa)).
objetivo(higiene, algas, recolectarMaterial(mar)).
objetivo(higiene, grasa, recolectarMaterial(animales)).
objetivo(higiene, hidroxidoDeCalcio, quimica([hacerPolvo, diluirEnAgua])).
objetivo(higiene, hidroxidoDeSodio, quimica([mezclarIngredientes])).
objetivo(higiene, jabon, quimica([mezclarIngredientes, dejarSecar])).

%% Agregar objetivos para otros proyectos aquí...

objetivo(salud, plantaAlgodon, recolectarMaterial(bosque)).
objetivo(salud, vendaje, quimica([hilado, tejido, esterilizado])).
objetivo(salud, metal, recolectarMaterial(mina)).
objetivo(salud, tijera, artesania(4)).
objetivo(salud, azucar, recolectarMaterial(selva)).
objetivo(salud, alcohol, quimica([fermentizacion, destilacion])).
objetivo(salud, jabon, quimica([mezclarIngredientes, dejarSecar])).
objetivo(salud, botiquin, artesania(5)).

%% También se espera que agreguen más información para los predicados
%% prerrequisito/2 y conseguido/1 para probar lo que necesiten

% prerrequisito(Prerrequisito, Producto)
prerrequisito(almejas, hidroxidoDeCalcio).
prerrequisito(hidroxidoDeCalcio, hidroxidoDeSodio).
prerrequisito(algas, hidroxidoDeSodio).
prerrequisito(hidroxidoDeSodio, jabon).
prerrequisito(grasa, jabon).

prerrequisito(metal, tijera).
prerrequisito(plantaAlgodon, vendaje).
prerrequisito(azucar, alcohol).
prerrequisito(vendaje, botiquin).
prerrequisito(alcohol, botiquin).
prerrequisito(cinta, botiquin).
prerrequisito(tijera, botiquin).
prerrequisito(jabon, botiquin).

% conseguido(Producto)
conseguido(almejas).
conseguido(algas).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Implementar nuevos predicados aquí...


%% Punto 1.

% puedeRealizar(Persona, TareaARealizar)
puedeRealizar(senku, quimica(_)).
puedeRealizar(chrome, recolectarMaterial(Material)):-
  Material \= animales.
puedeRealizar(kohaku, recolectarMaterial(animales)).
puedeRealizar(suika, recolectarMaterial(playa)).
puedeRealizar(suika, recolectarMaterial(bosque)).
puedeRealizar(suika, quimica([mezclarIngredientes])).
puedeRealizar(chrome, quimica(Procesos)):-
  length(Procesos, CantidadProcesos),
  CantidadProcesos =< 3.
puedeRealizar(senku, artesania(Dificultad)):-
  Dificultad =< 6.
puedeRealizar(_, artesania(Dificultad)):-
  Dificultad < 3.  



%% Punto 2.

% objetivoFinal(Proyecto, Producto)
objetivoFinal(Proyecto, ObjetivoFinal):-
  perteneceAProyecto(ObjetivoFinal, Proyecto),
  not((prerrequisito(ObjetivoFinal, OtroProducto), perteneceAProyecto(OtroProducto, Proyecto))).

% perteneceAProyecto(Producto, Proyecto)
perteneceAProyecto(Producto, Proyecto):-
  objetivo(Proyecto, Producto, _).

%% Punto 3.

% esViable(Proyecto)
esViable(Proyecto):-
  proyecto(Proyecto),
  forall(objetivo(Proyecto, _ , TareaARealizar), puedeRealizar(_, TareaARealizar)).

proyecto(Proyecto):-
  objetivo(Proyecto,_,_).

%% Punto 4.
% esIndispensable(Persona)
esIndispensable(Persona, Objetivo):-
  objetivo(_, Objetivo, Tarea),
  puedeRealizar(Persona, Tarea),
  not((puedeRealizar(OtraPersona,Tarea), OtraPersona \= Persona)).

%% Punto 5
% proyectoPuedeIniciar(Proyecto, Objetivo)
objetivoPuedeIniciar(Proyecto, Objetivo):-
  objetivo(Proyecto, Objetivo, _),
  not(conseguido(Objetivo)),
  forall(prerrequisito(Prerrequisito, Objetivo), conseguido(Prerrequisito)).

%% Punto 6
% tiempoRestante(Proyecto, Tiempo)
tiempoRestante(Proyecto, Tiempo):-
  esViable(Proyecto),
  findall(Tiempos, (objetivo(Proyecto, Objetivo, Tarea), not(conseguido(Objetivo)), tiempoEstimado(Tarea, Tiempos)), TiemposEstimados),
  sum_list(TiemposEstimados, Tiempo).

tiempoEstimado(recolectarMaterial(mar), 8).
tiempoEstimado(recolectarMaterial(cuevas), 48).
tiempoEstimado(recolectarMaterial(Donde), 3):-
  Donde \= mar, 
  Donde \= cuevas.
tiempoEstimado(artesania(Dificultad), Dificultad).

tiempoEstimado(quimica(Tareas), Tiempo):-
  length(Tareas, Largo),
  Tiempo is 2*Largo.

%% Punto 7

esCostoso(Objetivo):-
  objetivo(_, Objetivo, TareaARealizar),
  tiempoEstimado(TareaARealizar, Tiempo),         
  Tiempo > 5.

bloqueaAvance(Objetivo, OtroObjetivo) :-
  prerrequisito(Objetivo, OtroObjetivo).
bloqueaAvance(Objetivo, Otro) :-
  prerrequisito(Objetivo, Otro),
  bloqueaAvance(Otro, _).
  
esCritico(Objetivo, Proyecto):-
  objetivo(Proyecto, Objetivo, _),   
  esCostoso(Objetivo),
  bloqueaAvance(Objetivo, _).

%% Punto 8
% leConvieneTrabajar(Persona,Objetivo)


leConvieneTrabajar(Persona,Objetivo):-
  objetivo(Proyecto, Objetivo,Tarea),
  objetivoPuedeIniciar(Proyecto,Objetivo),
  esViable(Proyecto),
  puedeRealizar(Persona,Tarea),
  esValioso(Persona,Objetivo).

% esValioso(Persona,Objetivo)

esValioso(Persona,Objetivo):-
  esIndispensable(Persona,Objetivo).

esValioso(Persona,Objetivo):-
  objetivo(Proyecto, Objetivo,Tarea),
  puedeRealizar(Persona,Tarea),
  tiempoEstimado(Tarea,TiempoDelObjetivo),
  tiempoRestante(Proyecto,TiempoRestante),
  TiempoDelObjetivo > TiempoRestante // 2.


esValioso(Persona, Objetivo) :-
    objetivo(Proyecto, Objetivo,Tarea),
    puedeRealizar(Persona,Tarea),
	  esCritico(Objetivo, Proyecto),
    forall(
        (objetivoPuedeIniciar(Proyecto, OtroObjetivo), OtroObjetivo \= Objetivo),
        (loPuedeHacerOtraPersona(Persona, OtroObjetivo))).
	
loPuedeHacerOtraPersona(Persona,OtroObjetivo):-
	objetivo(_,OtroObjetivo,OtraTarea),
  puedeRealizar(OtraPersona,_),
  OtraPersona \= Persona,
	puedeRealizar(OtraPersona,OtraTarea).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Pruebas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- begin_tests(tp).

%% Tests de referencia
%% Testeo de consultas que esperan que sean ciertas
test(elHidroxidoDeCalcioEsPrerrequisitoDelJabon, nondet):-
  prerrequisito(hidroxidoDeSodio, jabon).

%% Testeo de consultas que esperan que sean falsas
test(elJabonNoEsPrerrequisitoDelHidroxidoDeCalcio, fail):-
  prerrequisito(jabon, hidroxidoDeSodio).

%% Testeo de consultas existenciales con múltiples respuestas => inversibilidad
test(prerrequisitosDelHidroxidoDeSodio, set(Producto == [hidroxidoDeCalcio, algas])):-
  prerrequisito(Producto, hidroxidoDeSodio).


%% Tests de nuevos requerimientos, implementar aquí...
% Punto 1.
test(chromeNoPuedeRecolectarAnimales, fail):-
  puedeRealizar(chrome, recolectarMaterial(animales)).
test(chromeNoPuedeTrabajarEnProductosQuimicosQueTenganMasDeTresProcesos, fail):-
  puedeRealizar(chrome, quimica([mezclarIngredientes, dejarSecar, diluirEnAgua, hacerPolvo])).
test(senkuNoPuedeTrabajarEnArtesaniasDeDificultadMayorA6, fail):-
  puedeRealizar(senku, artesania(7)).
test(todasLasPersonasDelReinoPuedenHacerArtesaniasConDificultadMenorA3, nondet):-
  puedeRealizar(_, artesania(2)).
% Punto 2.
test(elBotiquinPerteneceAlProyectoSalud, nondet):-
  perteneceAProyecto(botiquin, salud).
test(elObjetivoFinalDelProyectoHigieneEsElJabon, nondet):-
  objetivoFinal(higiene, jabon).
test(objetivoFinalEsInversibleParaSuPrimerParametro, set(Proyecto == [higiene, salud])):-
  objetivoFinal(Proyecto, _).
test(objetivoFinalEsInversibleParaSuSegundoParametro, set(ObjetivoFinal == [jabon, botiquin])):-
  objetivoFinal(_, ObjetivoFinal).
% Punto 3.
test(proyectosViables, set(Proyecto == [higiene, salud])):-
  esViable(Proyecto).
% Punto 4.
test(kohakuEsIndispensableParaGrasa, nondet):-
  esIndispensable(kohaku, grasa).
test(suikaEsIndispensableParaHidroxidoDeSodio, fail):-
  esIndispensable(suika, hidroxidoDeSodio).
test(senkuEsIndispensableParaBotiquin, set(Persona == [senku])):-
  esIndispensable(Persona, botiquin).
% Punto 5.
test(elJabonNoPuedeIniciar, fail):-
  objetivoPuedeIniciar(higiene, jabon).
test(laGrasaPuedeIniciar, nondet):-
  objetivoPuedeIniciar(higiene, grasa).
% Punto 6.
test(aHigieneLeFaltan13Horas, nondet):-
  tiempoRestante(higiene, 13).
% Punto 7.
test(plantaDeAlgodonNoEsUnObjetivoCritico, fail):-
  esCritico(plantaAlgodon, salud).
test(algasEsUnObjetivoCritico, nondet):-
  esCritico(algas, higiene).
test(esCriticoEsInversible, set(Objetivo == [algas])):-
  esCritico(Objetivo,higiene). 
test(esCriticoEsInversible, set(Proyecto == [salud])):-
  esCritico(vendaje,Proyecto). 
% Punto 8.
test(aChromeNoLeConvieneTrabajarEnCrearTijeras, fail):-
  leConvieneTrabajar(chrome,tijera).
test(akohakuLeConvieneTrabajarEnCrearGrasa, nondet):-
  leConvieneTrabajar(kohaku,grasa).
test(leConvieneRealizarCreacionDeAzucarAChrome, set(Persona == [chrome])):-
  leConvieneTrabajar(Persona, azucar).
test(leConvieneTrabajarEnExtraerGrasaAkohakuLe, set(Objetivo == [grasa])):-
  leConvieneTrabajar(kohaku,Objetivo).
test(aChromeleConvieneTrabajarEnRecolectarMetalYAzucar, set(Objetivo == [metal,azucar])):-
  leConvieneTrabajar(chrome,Objetivo).

:- end_tests(tp). 