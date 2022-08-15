import wollok.game.*

class Pointer {
	const property image
	var property position
	
	method display(){
		game.addVisualCharacter(self)
		game.whenCollideDo(self, {hitbox => hitbox.hit(self)})
	}
	
	method remove(){
		game.removeVisual(self)
	}
	
}
