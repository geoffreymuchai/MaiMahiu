package complaintsystem

import grails.converters.JSON

class MessageController {

    def scaffold = true
	
    def receive = {
        def message = new Message(src: params.from, message: params.message).save(flush:true)
		def status = processMessage(message) ? true : false
        render(contentType: "application/json") {
            payload("success" : "$status")
        }


    }
	
	def register = {
		def registrationMessage = "Please register in this format: [Fixed Address or Main Road], [Birth Year], [1 for Consumer, 2 for Vendor], [Account Number or 0000 if purchasing from vendor]"
		def send = [success: "true", task: "send", message:registrationMessage]
		def payload = [payload:send]
		render payload as JSON
	}

	def processMessage(Message m) {
		def customer
		def complaint
		def tm = splitMessage(m.message)
		def utility

		if(tm) {
			if(Customer.findByPhoneNumber(m.src)){
				customer = Customer.findByPhoneNumber(m.src)
			}else {
				customer = new Customer(phoneNumber:m.src, accountNumber:tm?.accNo).save(flush:true, failOnError:true)
			}
			
			if(tm?.location)
				utility= Utility.findByLocation(tm.location)
			complaint = new Complaint(affects:customer, content: tm?.complaint, source:m, utility: utility).save(flush:true)
			setComplains(complaint, tm.complaint)
		} else {
			[]
		}
		
	}

	def setComplains(complaint, message) {
		boolean found
		ComplaintType.list(sort:"urgencyRating", order:"asc").each {ct ->
			if(!found) {
				def tagList = ct?.tags?.tokenize(",")
				tagList.collect {
					if(message.contains(it)) {
						complaint.setType(ct)
						found = true
					}
				}
			}
		}
	}

	def splitMessage(message) {
        def tm = message.tokenize("#")
		println "$message size is ${tm.size()}"
		if(tm.size() == 1) {
			[]
		}else if(tm.size() > 3)
            [accNo: tm[0], location: tm[1], complaint:tm[2]]
        else
            [accNo: tm[0], complaint:tm[2]]

    }
}
