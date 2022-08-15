import wollok.game.*

mixin Energy {
    var property energy = 100
    method reduceEnergy(amount) {
    	energy = energy - amount
    }
}

mixin GetsHurt inherits Energy {
    method receiveDamage(amount) {
        self.reduceEnergy(amount) 
        // hereda método del padre
        // estamos corrigiendo un reporte de error incorrecto de Wollok
        // https://github.com/uqbar-project/wollok/issues/2006
        // pero el programa funciona perfectamente
    }
    
    method energy()
	method energy(e)
}

mixin Attacks {
    var property power = 10
    method attack(other) {
        other.receiveDamage(power)
        self.energy(self.energy() - 1)
    }
    method nya(){
    	console.println("done")
    }
    
    method energy()
	method energy(e)
    
}

class Warrior {}


const warrior1 = object inherits GetsHurt and Attacks and Warrior {}

