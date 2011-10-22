package complaintsystem

class Customer {

    static constraints = {
		phoneNumber (blank:false, nullable:false)
		accountNumber(nullable:true)
		name(nullable:true)
		reference(nullable:true)
    }

    String accountNumber
    String phoneNumber
	String name
	String referenceNo

}
