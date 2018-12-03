%%%%%%%%BASE DE CONOCIMIENTOS%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
usuario(alex,2,150).
usuario(ivan,7,30).
usuario(lucas,8,120).
usuario(franco,10,300).
usuario(guido,3,80).
usuario(michael,1,100).
usuario(stephen,5,200).
usuario(manu,9,300).

grupo(pibesDeLaFacu,[alex,ivan,lucas,franco],estudio(1)).
grupo(superEnCasa,[guido,ivan,lucas],salidas).
grupo(basquet,[michael,stephen,manu],salidas).

descripcion(pibesDeLaFacu,"las materias se recursan, los momentos de la vida no").
descripcion(superEnCasa,"rivales no, enemigos").
descripcion(basquet,"no pain, no gain").

administrador(alex,pibesDeLaFacu).
administrador(lucas,superEnCasa).
administrador(manu,basquet).

envio(notaDeVoz(20),lucas,superEnCasa).
envio(texto(140,picante),franco,pibesDeLaFacu).
envio(foto([stephen,michael]),manu,basquet).

%%%%%%%%%%%%%%EJERCICIO A%%%%%%%%%%%%%%%%
grupoDivertido(NombreGrupo):-
	grupo(NombreGrupo,_,estudio(NivelSeriedad)),
	NivelSeriedad < 3.

grupoDivertido(NombreGrupo):-
	grupo(NombreGrupo,_,salidas).

%%%%%%%%%%%%%%EJERCICIO B%%%%%%%%%%%%%%%%
esCrack(Persona):-
	usuario(Persona,_,_),
	estaEnGrupoDiver(Persona),
	nivelFarandula(Persona,Nivel),
	Nivel >= 200.
	
nivelFarandula(Persona,Nivel):-
	usuario(Persona,CalidadFoto,Cantusuarios),
	Nivel is (CalidadFoto*10 + Cantusuarios).

estaEnGrupoDiver(Persona):-
	usuario(Persona,_,_),
	grupo(NombreGrupo,Participantes,_),
	member(Persona,Participantes),
	grupoDivertido(NombreGrupo).

%%%%%%%%%%%%%%EJERCICIO C%%%%%%%%%%%%%%%%
grupoCheto(NombreGrupo):-
	grupo(NombreGrupo,_,_),
	forall(participaEnGrupo(Persona,NombreGrupo),esCrack(Persona)),
	longDescripcionMinima(NombreGrupo,20),
	grupoDivertido(NombreGrupo).

participaEnGrupo(Persona,NombreGrupo):-
	grupo(NombreGrupo,Participantes,_),
	member(Persona,Participantes).

longDescripcionMinima(NombreGrupo,MinRequerido):-
	descripcion(NombreGrupo,Desc),
	length(Desc,Longitud),
	Longitud > MinRequerido.

%%%%%%%%%%%%%%EJERCICIO D%%%%%%%%%%%%%%%%
nivelTotal(NombreGrupo,SumaTot):-
	findall(Nivel,((participaEnGrupo(Persona,NombreGrupo),not(administrador(Persona,NombreGrupo))),nivelFarandula(Persona,Nivel)),ListaNiveles),
	sumlist(ListaNiveles,SumaTot).

nivelAdm(NombreGrupo,NivAdm):-
	administrador(Adm,NombreGrupo),
	nivelFarandula(Adm,NivAdm).

%%%%%%%%%%%%%%EJERCICIO E%%%%%%%%%%%%%%%%
mensajeValeLaPena(Mensaje):-
	envio(Mensaje,Emisor,NombreGrupo),
	tipoMensajeValeLaPena(Mensaje,NombreGrupo),
	esCrack(Emisor).
	
tipoMensajeValeLaPena(notaDeVoz(Duracion),_):-
	Duracion < 30.

tipoMensajeValeLaPena(texto(CantCaract,picante),_):-
	CantCaract < 100.

tipoMensajeValeLaPena(foto(ParticipantesFoto),NombreGrupo):-
	forall(member(UnParticipante,ParticipantesFoto),participaEnGrupo(UnParticipante,NombreGrupo)).

%%%%%%%%%%%%%%EJERCICIO F%%%%%%%%%%%%%%%%
sonConocidos(Persona1,Persona2):-
	compartenGrupo(Persona1,Persona3),
	sonConocidos(Persona3,Persona2).

sonConocidos(Persona1,Persona2):-
	compartenGrupo(Persona1,Persona2).

compartenGrupo(Persona1,Persona2):-
	usuario(Persona1,_,_),
	usuario(Persona2,_,_),
	Persona1 \= Persona2,
	participaEnGrupo(Persona1,NombreGrupo),
	participaEnGrupo(Persona2,NombreGrupo).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%PRUEBAS%%%%%%%%%%%%%%%%%%%%
/*
grupoDivertido(Cuales).
Cuales = pibesDeLaFacu ;
Cuales = superEnCasa ;
Cuales = basquet.

esCrack(Quienes).
Quienes = lucas ;
Quienes = franco ;
Quienes = stephen ;
Quienes = manu.

grupoCheto(Cuales).
false.

nivelTotal(Grupo,Nivel).
Grupo = pibesDeLaFacu,
Nivel = 2200 ;
Grupo = superEnCasa,
Nivel = 2230 ;
Grupo = basquet,
Nivel = 2420.

mensajeValeLaPena(Cuales).
Cuales = notaDeVoz(20) ;
Cuales = foto([stephen, michael]).
*/