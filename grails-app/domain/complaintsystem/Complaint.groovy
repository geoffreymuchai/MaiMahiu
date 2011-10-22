package complaintsystem

class Complaint {

    static constraints = {
		type(nullable:true)
		affects(nullable:true)
		utility(nullable:true)
		source(nullable:true)
    }

//    String complaintText

	String content
    static belongsTo = [affects: Customer, utility: Utility, source: Message]
	static hasMany = [types: ComplaintType]
	
	String toString() {
		"${affects*.phoneNumber}"
	}
}

