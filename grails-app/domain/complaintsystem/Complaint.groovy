package complaintsystem

class Complaint {

    static constraints = {
    }

    String content

    static belongsTo = [type: ComplaintType, affects: Customer, utility: Utility, source: Message]
}

