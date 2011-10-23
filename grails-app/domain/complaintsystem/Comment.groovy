package complaintsystem

class Comment {

    static constraints = {
        text(nullable: false, maxSize: 3000)
        complaint(nullable: false)
        user(nullable: false)
    }

    static belongsTo = [complaint: Complaint, user: ShiroUser]
    String text
    Date dateCreated

    String toString() {
        return "${text}"
    }
}
