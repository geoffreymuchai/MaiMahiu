package complaintsystem

class Customer {

    static constraints = {
		accountNumber(nullable:true)
		name(nullable:true)
    }

    String accountNumber
    String phoneNumber
	String name

    String toString() {
        return "${accountNumber}"
    }
}
