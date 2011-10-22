package complaintsystem

class MessageReceipientController {

    def receive = { RecipientCommand rc ->
		rc.from = params.from
		rc.message = params.message
    }
}

class RecipientCommand {
    String from
    String message
}