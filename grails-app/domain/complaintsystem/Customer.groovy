package complaintsystem

class Customer {

    static constraints = {
		phoneNumber (blank:false, nullable:false)
		accountNumber(nullable:true)
		name(nullable:true)
		referenceNo(nullable:true)
    }

    String accountNumber
    String phoneNumber
	String name
	String referenceNo

    String toString() {

    }
}
