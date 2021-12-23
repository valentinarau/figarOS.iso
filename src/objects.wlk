import wollok.game.*
import example.*
import tocadiscos.*

class Windows{
	var property imagenes = ["assets/wxp.png","assets/w2000.png","assets/w98.png"]
	var property image = "assets/wxp.png"
	var property position = game.origin()
	
	method tirarError(){ 
		error.image(errores.anyOne()) 
		game.addVisualIn(error,game.at(13,3.randomUpTo(6))) 
		tocadiscos.tocarFondo(errorWindows)
		game.schedule(2000,{game.stop()})
	}
	
	method marcar(){
		self.tirarError()
	}
}

const errores = ["assets/werror.png","assets/werrpr.png"]

object error{
	var property image = "assets/werror.png"
	var property position = game.origin()
}


class Bitcoin{
	const angulos = [bitcoinFrente,bitcoin34,bitcoinChata,bitcoin43,bitcoinAtras,bitcoin43,bitcoinChata,bitcoin34]
	var property image = bitcoinFrente
	var property position = game.origin()
	
	
	method marcar(){
		game.removeVisual(self)
		cantidadMonedas.aumentarMonedas()
		figaro.meow()
	}
	
	method animar(){
	var anterior = angulos

		game.onTick(500,"moverBitcoin",{=>  anterior = anterior.drop(1) if(anterior.size()==0) {anterior = angulos} self.image(anterior.head()) })
	}
}

const bitcoinFrente = "assets/bitcoin.png"
const bitcoinAtras = "assets/bitcoin - Copy.png"
const bitcoin34 = "assets/bitcoin - Copy (2).png"
const bitcoin43 = "assets/bitcoin - Copy - Copy (2).png"
const bitcoinChata = "assets/bitcoin - Copy - Copy.png"


object generador{
	
	method generarBitcoin(){
		game.onTick(3000,"bitcoin",{=> if (cantidadMonedas.numero()>10) {game.removeTickEvent("bitcoin") game.removeTickEvent("windows") game.schedule(500,{pantallaInicio.ganar()}) }
			var bitcoin = new Bitcoin(position = game.at(1.randomUpTo(21),4.randomUpTo(11))) game.addVisual(bitcoin) bitcoin.animar() 
	})
	
	}
	
	method generarWindows(){
		game.onTick(5000,"windows",{=>  var bug = new Windows () bug.image(bug.imagenes().anyOne()) if(cantidadBugs.numero() >10){bug.tirarError() } else {cantidadBugs.aumentarBugs()} game.addVisualIn(bug,game.at(1.randomUpTo(21),4.randomUpTo(11)))})
	}
	
	

}

object cantidadBugs{
	
	var property numero = 0

	method aumentarBugs(){
		numero += 1
	}

}

const  bitcoinInicio = new Bitcoin (position = game.at(1,11)) 

class Imagen{
	var property image
	var property position
}

const asuka = new Imagen(image = "assets/asuka.png",position = game.at(3,3))
const uwu = new Imagen(image = "assets/uwu.png",position = game.at(2,3))
const rei = new Imagen(image = "assets/monstro.png",position = game.at(7,3))
const angel = new Imagen(image = "assets/puto.png",position = game.at(20,3))

const yatta = new Imagen(image = "assets/yatta.png",position = game.at(10,5))
const cumple = new Imagen(image = "assets/happyB.png",position = game.at(10,3))
const perdiste = new Imagen(image = "assets/perdiste.png",position = game.at(10,5))
const zeroTwo = new Imagen(image = "assets/02.png",position = game.at(3,3))

