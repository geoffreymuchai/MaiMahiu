package complaintsystem

class Complaint {

    static constraints = {
    }

//    String complaintText

    static belongsTo = [type: ComplaintType, affects: Customer, utility: Utility, source: Message]
}

