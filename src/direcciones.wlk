import wollok.game.*

class Direccion{
	var property sentido
	var lugares
	method mover(unaPosicion) = sentido.mover(unaPosicion,lugares) 
	method hayElementos(posicion) = !game.getObjectsIn(sentido.mover(posicion,lugares)).isEmpty()
}

object arriba  {
	 method mover(posicion,lugares) = posicion.up(lugares)
	 
}

object abajo  {
	 method mover(posicion,lugares) = posicion.down(lugares)
}

object izquierda  {
	 method mover(posicion,lugares) = posicion.left(lugares)
}

object derecha  {
	 method mover(posicion,lugares) = posicion.right(lugares)
}
