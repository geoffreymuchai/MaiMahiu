package complaintsystem

class Complaint {

    static constraints = {
		type(nullable:true, blank:true)
		affects(nullable:true, blank:true)
		utility(nullable:true, blank:true)
		source(nullable:true, blank:true)
		content(nullable:false)
		
    }

//    String complaintText

	String content
    static belongsTo = [type: ComplaintType, affects: Customer, utility: Utility, source: Message]
	
	String toString() {
		"${affects*.phoneNumber}"
	}
}

