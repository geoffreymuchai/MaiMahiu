package complaintsystem

class MessageReceipientController {

    def receive = { RecipientCommand rc ->

    }
}

class RecipientCommand {
    String from
    String message
}