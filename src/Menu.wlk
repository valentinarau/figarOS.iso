import wollok.game.* 

class Menu {
	const property position
	const property options
	const property image
	var currentIndex
	const property slots // [<position>, ...]
	
	method displayOption(o){
		const freeSlots = slots.filter({s => game.getObjectsIn(s).isEmpty()})
		if(!freeSlots.isEmpty()) o.position(freeSlots.first())
		game.addVisual(o)
	}
	
	method select(){
		const selected = options.get(currentIndex)
		selected.action(self)
	}
	
	method display(){
		game.addVisual(self)
		options.forEach({o => self.displayOption(o)})
	}
	
	method remove(){
		options.forEach({o => game.removeVisual(o)})
		game.removeVisual(self)
	}
	
	method nextOption(){
		options.get(currentIndex).unHover()
		currentIndex += 1
		if(options.size() == currentIndex) currentIndex = 0
		options.get(currentIndex).hover()
	}
	
	method prevOption(){
		options.get(currentIndex).unHover()
		currentIndex -= 1
		if(0 > currentIndex) currentIndex = options.size() - 1
		options.get(currentIndex).hover()
	}
	
}

