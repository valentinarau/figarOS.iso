import wollok.game.*
import direcciones.*
import interfaz.*
import opciones.*
import tocadiscos.*
import recolectables.*
import noRecolectables.*
import menues.*

// Direcciones

const opcionArriba = new Direccion (lugares = 1,sentido = arriba)
const opcionAbajo = new Direccion(lugares = 1,sentido= abajo)
const opcionDerecha = new Direccion(lugares = 1,sentido= derecha)
const opcionIzquierda = new Direccion(lugares = 1,sentido= izquierda)

// Menues

const menuInicio = new Menu(
	opcionActual = comenzar,
	position = game.at(1,0),
	area = new AreaMenu(inicio = game.at(10,6), alto = 4, ancho = 1),
	items = [salir,creditos,musica,comenzar],
	puntero = punteroInicio
)

const menuMusica = new Menu(
	opcionActual = gtSunset,
	imagen = "assets/celu.png",
	position = game.at(1,0),
	area = new AreaMenu(inicio = game.at(9,4), alto = 5, ancho = 5),
	items = [atras,persona51,darkLine,afterRace,lotus,sunset],
	puntero = punteroMusica
	)

// Puntero

const punteroMusica = new Puntero(posicionInicial = game.at(9,5))
const punteroInicio = new Puntero(posicionInicial = game.at(10, 9))
const colisionador = new Puntero(image = "assets/cursor2.png",posicionInicial = game.at(15,3),libre = true)

// Imagenes

const asuka = new Imagen(image = "assets/asuka.png",position = game.at(3,3))
const uwu = new Imagen(image = "assets/uwu.png",position = game.at(2,3))

const yatta = new Imagen(image = "assets/yatta.png",position = game.at(10,5))
const cumple = new Imagen(image = "assets/happyB.png",position = game.at(10,3))
const zeroTwo = new Imagen(image = "assets/02.png",position = game.at(3,3))

// Recolectables

const bitcoinFrente = "assets/bitcoinFrente.png"
const bitcoinAtras = "assets/bitcoinAtras.png"
const bitcoin34 = "assets/bitcoin34.png"
const bitcoin43 = "assets/bitcoin43.png"
const bitcoinChata = "assets/bitcoinChata.png"

const errores = ["assets/werror.png","assets/werror2.png"]

// Inicio

const  bitcoinInicio = new Bitcoin (position = game.at(1,11)) 

// Sonido

const canciones = [persona5db,gtDarkLine,gtAfterRace,gtLotus,gtSunset]
const meow = "assets/cat-meow-2.mp3"
const windowsApagar = "assets/windowsApagar.mp3"
const errorWindows = "assets/errorSonido.mp3"
const persona5db = "assets/battleForEveryoneSoul.mp3"
const gtDarkLine = "assets/dark-line.mp3"
const gtAfterRace = "assets/lounge.mp3"
const gtLotus = "assets/lotus-in-dam.mp3"
const gtSunset = "assets/sunset-breeze.mp3"

