package complaintsystem

class Message {

    static constraints = {
    }

    String src
    String message
    Date dateCreated

    String toString() {
        return "${message}"
    }
}
