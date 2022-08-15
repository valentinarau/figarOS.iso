import Mixin.*
import wollok.game.*
import Game.*
import tst.*


class Hitbox inherits Visual {
	const property ttl
	const property action
	
	 method display(){
	 	self.addToGame()
		const ms = ttl * 1000
		game.schedule(ms,{self.remove()})
	}
	method remove(){
		self.removeFromGame()
	}
	
	method hit(player){
		self.removeFromGame()
		action.apply(player)
	}
	
	
}


class Bitcoin inherits Animated(frames = [], fps = 20, name = "coin", image = "") and Hitbox(action = hitCoin, ttl = 10){} 

/* 
 * class Bitcoin2 inherits AnimatedHitbox{
	
}


class AnimatedHitbox inherits Animated(frames = [],fps = 20, name = "coin", image = "" ) and Hitbox(action = hitCoin, ttl = 10){
	
	override method display(){
		super()
		self.animateReversed()
	}
	
	override method remove(){
		self.inanimate()
		super()
		
	}
	
}
 
 * */


class Bug inherits Hitbox(action = hitBug){}


