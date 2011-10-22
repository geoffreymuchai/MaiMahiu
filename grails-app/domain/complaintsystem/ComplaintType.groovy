package complaintsystem

class ComplaintType {

    static constraints = {
    }

    String description
    int menuIdx

    String toString() {
        return "${description}"
    }
}
