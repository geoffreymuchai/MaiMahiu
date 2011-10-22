package complaintsystem

class Complaint {

    static constraints = {
		type(nullable:true, blank:true)
		affects(nullable:true, blank:true)
		utility(nullable:true, blank:true)
		source(nullable:true, blank:true, unique:true)
		content(nullable:false)
		status(nullable:true, inList: ["New", "Viewed", "Resolved"])
		ticketNumber(nullable:false, unique:true)
    }

	def beforeInsert = {
		status = status ?: "New"
	}

    String content
    String status
	String ticketNumber
    static belongsTo = [type: ComplaintType, affects: Customer, utility: Utility, source: Message]
}

