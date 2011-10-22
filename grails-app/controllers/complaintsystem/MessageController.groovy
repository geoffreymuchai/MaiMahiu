package complaintsystem

class MessageController {

    def scaffold = true
	
    def receive = {
        def message = new Message(src: params.from, message: params.message).save(flush:true)
		processMessage(message)
        render(contentType: "application/json") {
            payload("success" : "true")
        }
    }
	
	def register = {
		def registrationMessage = ""
		render(contentType: "application/json") {
            payload("success" : "true")
        }
	}

	def processMessage(Message m) {

		
	}
}

//class RecipientCommand {
//    String from
//    String message
//}