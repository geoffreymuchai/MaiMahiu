import complaintsystem.*

class ShiroUser {
    String username
    String passwordHash
    String email

    static hasMany = [roles: ShiroRole, permissions: String]

    static belongsTo = [utility: Utility]

    static constraints = {
        username(nullable: false, blank: false)
        utility(nullable: true)
        email(nullable: true)
    }
}
