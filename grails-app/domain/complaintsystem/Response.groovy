package complaintsystem

class Response {

    String message
    String phoneNumber
    String status

    static constraints = {
        status(inList: ['Pending', 'Sent'], nullable: true)
        message(nullable: false)
        phoneNumber(nullable: false)
    }

    def beforeInsert = {
		status = status ?: "Pending"
	}
}
