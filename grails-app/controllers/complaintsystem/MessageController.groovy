package complaintsystem

class MessageController {

    def scaffold = true

    def receive = { RecipientCommand rc ->
		rc.from = params.from
		rc.message = params.message

        def message = new Message(src: rc.from, message: rc.message).save(flush:true)
        render ""
    }
}

class RecipientCommand {
    String from
    String message
}