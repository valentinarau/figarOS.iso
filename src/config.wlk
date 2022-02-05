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
	position = game.at(1,0),
	area = new AreaMenu(inicio = game.at(10,6), alto = 4, ancho = 1),
	items = [salir,creditos,musica,comenzar],
	puntero = punteroInicio
)

const menuMusica = new Menu(
	imagen = "assets/unnamed.png",
	position = game.at(1,0),
	area = new AreaMenu(inicio = game.at(9,4), alto = 5, ancho = 5),
	items = [atras,persona51,darkLine,afterRace,lotus,sunset]
	)

// Puntero

const punteroInicio = new Puntero(posicionInicial = game.at(10, 9))
const colisionador = new Puntero(image = "assets/cursor2.png",posicionInicial = game.at(15,3),libre = true)

// Imagenes

const asuka = new Imagen(image = "assets/asuka.png",position = game.at(3,3))
const uwu = new Imagen(image = "assets/uwu.png",position = game.at(2,3))
const rei = new Imagen(image = "assets/monstro.png",position = game.at(7,3))
const angel = new Imagen(image = "assets/puto.png",position = game.at(20,3))

const yatta = new Imagen(image = "assets/yatta.png",position = game.at(10,5))
const cumple = new Imagen(image = "assets/happyB.png",position = game.at(10,3))
const perdiste = new Imagen(image = "assets/perdiste.png",position = game.at(10,5))
const zeroTwo = new Imagen(image = "assets/02.png",position = game.at(3,3))

// Recolectables

const bitcoinFrente = "assets/bitcoin.png"
const bitcoinAtras = "assets/bitcoin2.png"
const bitcoin34 = "assets/bitcoin3.png"
const bitcoin43 = "assets/bitcoin4.png"
const bitcoinChata = "assets/bitcoin5.png"

const errores = ["assets/werror.png","assets/werrpr.png"]

// Inicio

const  bitcoinInicio = new Bitcoin (position = game.at(1,11)) 


