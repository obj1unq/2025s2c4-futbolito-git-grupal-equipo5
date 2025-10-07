/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)

	var property esTitular = true 

	method estado() {
	  return if(esTitular){"lionel-titular.png"}
	  else {
		"lionel-suplente.png"
		}
	}
	
	method image() {
		return self.estado()
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}

	method validarSiPuedeCambiarCamiseta() {
	  if(position.x()!=0){
		self.error("No esta en la posicion para cambiar la camiseta")
	  }
	}

	method cambiarCamiseta() {
	  self.validarSiPuedeCambiarCamiseta()
	  if (esTitular) {
        esTitular = false
    } else {
        esTitular = true
    }
	}
	
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	
}
