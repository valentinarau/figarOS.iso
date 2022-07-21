class Option {
	const property hovered
	const property noHovered
	var property image
	var property position
	
	method hover(){
		image = hovered
		self.image()
	}

	method unHover(){
		image = noHovered
		self.image()
	}
	
	method action(menu){
		menu.remove()        
	}
	
}

// TODO: the idea is to implement options that override action and do super
