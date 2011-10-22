package complaintsystem

class Complaint {

    static constraints = {
		type(nullable:true, blank:true)
		affects(nullable:true, blank:true)
		utility(nullable:true, blank:true)
		source(nullable:true, blank:true)
		content(nullable:false)
		status(nullable:true, inList: ["New", "Viewed", "Resolved"])
    }

    String content
    String status
    static belongsTo = [type: ComplaintType, affects: Customer, utility: Utility, source: Message]
}

