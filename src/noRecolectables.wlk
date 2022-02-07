import wollok.game.*
import tocadiscos.*
import config.*

class Imagen{
	var property image
	var property position
}

object lauti{
	var property image = "assets/lauti2.gif"
	var property position = game.at(22,0)
	method marcar(){}
}

object valen{
	var property image = "assets/credits.png"
	var property position = game.at(10,5)
	
	method animar(){
		game.onTick(2000,"creditos",{self.position(game.at(5.randomUpTo(12),3.randomUpTo(11)))} )
	}
	
	}

object figaro{
	var property image = "assets/figaro.png"
	var property position = game.at(12,2)
	
	method meow(){
		game.say(self,"meow")
		tocadiscos.tocar(meow)
	}
	method marcar(){}
	
}

object monedas{
	var property image = "assets/monedas.png"
	var property position = game.at(18,1)
}
object cantidadMonedas{
	var property position = game.at(21,0)
	var property numero = 0
	var property text = numero.toString()

	method marcar(){}

	method textColor() = "FFFFFF"
	method aumentarMonedas(){
		numero += 1
		text = numero.toString()	}
	method inicializar(){
		numero = 0
		text = numero.toString()
	}
	
}

object fondo{
	var property image = "assets/car1.png"
	var property position = game.origin()
	var imagen1 = "assets/car1.png"
	var imagen2= "assets/car2.png"
	var imagen3= "assets/car3.png"
	var imagen4 = "assets/car4.png"
	var imagenes = [imagen1,imagen2,imagen3,imagen4]
	
method animar(){
	game.onTick(100, "carMoving", { => self.image (imagenes.anyOne() )})
}
}