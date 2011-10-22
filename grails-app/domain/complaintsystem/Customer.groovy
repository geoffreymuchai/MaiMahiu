package complaintsystem

class Customer {

    static constraints = {
		accountNumber(nullable:true)
		name(nullable:true)
		referenceNo(nullable:true)
    }

    String accountNumber
    String phoneNumber
	String name
	String referenceNo
}
