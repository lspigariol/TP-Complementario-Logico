# TP-Complementario-Logico
Guasapp

CONSIGNA:

GUASAPP
La aplicación de mensajería móvil mundialmente conocida Guasapp tiene una rara pero compleja selección y categorización sobre los grupos de chats que existen.

De los usuarios de Guasapp se sabe su nombre, la calidad de su foto de perfil (del 1 al 10) y la cantidad de contactos que este tiene en su agenda. Se conoce a los siguientes contactos:
usuario(alex,2,150).
usuario (ivan,7,30).
usuario (lucas,8,120).
usuario (franco,10,300).
usuario (guido,3,80).
usuario(michael,1,100).
usuario(stephen,5,200).
usuario(manu,9,300).

Hay dos tipos de grupos, los de estudio, los cuales poseen un nivel de seriedad del 1 al 5, y los grupos de salidas. Agregar a la base de conocimiento los siguientes grupos:

Los Pibes de la Facu, en el que participan Alex(administrador), Iván, Lucas y Franco, es un grupo de estudio, con nivel de seriedad 1. Su descripción es “las materias se recursan, los momentos de la vida no”.

Superclásico en Casa, en el que participan Guido, Iván y Lucas(administrador), y su descripción es “rivales no, enemigos”. Es un grupo de salidas.

Básquet, en el que participan Michael, Stephen y Manu(administrador), y su descripción es “no pain, no gain”.

También tenemos la posibilidad de diferencias ciertos tipos de mensaje que se pueden llegar a enviar dentro de los grupos. Un mensaje esta formado por la persona que lo mandó, un grupo al que lo envió, y el tipo de mensaje. Hay tres tipos de mensaje:

Texto, del cual se sabe la cantidad de caracteres y si es picante o tibio.
Nota de voz, que solo se conoce su duración en segundos.
Foto, el cual tiene una lista de personas involucradas en ella.

Agregar a la base de conocimientos los siguientes mensajes:
envio(notaDeVoz(20),lucas,superEnCasa).
envio (texto(140,picante),franco,pibesDeLaFacu).
envio (foto([stephen,michael]) ,manu,basquet).
 
Se pide:
a)   Definir un predicado que determine si el grupo es divertido. Esto ocurre cuando el grupo tiene un nivel de seriedad menor a 3, o bien si es un grupo de salidas.
b)  	Saber si una persona es crack. Esto pasa si está en algún grupo divertido y su nivel de farándula es mayor o igual a 200. El nivel de farándula se calcula como cantContactos + calidadFoto*10.
c)   Conocer qué grupos son chetos. Los grupos chetos son los que están formado únicamente por cracks y su descripción tiene mas de 20 caracteres. Obviamente para ser cheto, el grupo también tiene que ser divertido.
d)  	Determinar el nivel total de un grupo. Este se calcula como la suma de todos los niveles de farándula de sus integrantes. Ojo, el nivel del administrador no cuenta!
e)  	Conocer si un mensaje vale la pena. Esto ocurre cuando:
  Si es un texto tiene menos de 100 caracteres y es picante.
  Si es una nota de voz dura menos de 30 segundos.
  Si es una foto, todos los que aparezcan en la foto deben ser del grupo.
Aparte de todo esto, para que el mensaje valga la pena el que lo envía debe ser crack también.
f)  Saber si una persona es conocido de otra persona. Esto ocurre si la primera    comparte algún grupo con la segunda. O si la primera comparte grupo con una tercera persona que a la vez comparte grupo con la segunda. Y así sucesivamente.

