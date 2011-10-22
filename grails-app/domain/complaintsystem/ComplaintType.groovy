package complaintsystem

class ComplaintType {

    static constraints = {
    }

    String description
    int menuIdx
    int urgencyRating //rating for the urgency of an issue
    String tags //a comma sepearted list of tags that can match this issue

    String toString() {
        return "${description}"
    }
}
