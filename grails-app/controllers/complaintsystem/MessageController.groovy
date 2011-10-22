package complaintsystem

class MessageController {

    def scaffold = true

    def receive = {

        def message = new Message(src: params.from, message: params.message).save(flush:true)

//        def customer


        render(contentType: "application/json") {
            payload("success" : "true")
        }
    }
}

//class RecipientCommand {
//    String from
//    String message
//}