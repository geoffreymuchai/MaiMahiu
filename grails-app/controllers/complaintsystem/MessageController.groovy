package complaintsystem

import grails.converters.JSON

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
		def registrationMessage = "Please register in this format: [Fixed Address or Main Road], [Birth Year], [1 for Consumer, 2 for Vendor], [Account Number or 0000 if purchasing from vendor]"
		def send = [success: "true", task: "send", message:registrationMessage]
		def payload = [payload:send]
		render payload as JSON
	}

	def processMessage(Message m) {
		
	}
}