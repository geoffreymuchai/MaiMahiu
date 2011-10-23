package complaintsystem

class ShiroUser {
    String username
    String passwordHash
    String email

    static belongsTo = [utility: Utility]

    static hasMany = [roles: ShiroRole, permissions: String]

    static constraints = {
        username(nullable: false, blank: false)
        utility(nullable: true)
    }

    String toString() {
        return "${username}"
    }
}
