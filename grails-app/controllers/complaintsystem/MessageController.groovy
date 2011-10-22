package complaintsystem

import grails.converters.JSON

class MessageController {

    def scaffold = true
	
    def receive = {
        def message = new Message(src: params.from, message: params.message).save(flush:true)
		processMessage(message)
        render(contentType: "application/json") {
            payload("success" : "true")
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
		def tm = [accountNo:"456789", location:"Kikuyu",source:"message"]
		println "find response -" + Customer.findByPhoneNumber(m.src)
		if(!Customer.findByPhoneNumber(m.src)){
			customer = Customer.findByPhoneNumber(m.src)
		}else {
			customer = new Customer(phoneNumber:m.src, accountNumber:tm?.accountNo).save(flush:true, failOnError:true)
		}
		println "customer ${customer.phoneNumber}"
		complaint = new Complaint(affects:customer, content: tm?.source)
		println "complaint created $complaint"
		def utility = Utility.findByLocation(tm?.location)
		setComplains(complaint, m)
		complaint.setUtility(utility)
		complaint.setSource(m).save(flush:true, failOnError:true)
		println "Complaint utilities: ${complaint.utitlity}"
		println "complaint customer: ${complaint.affects}"
		println "Complaint types ${complaint.type}"
		println "complaint created"
	}

	def setComplains(complaint, message) {
		ComplaintType.list().each {ct ->
			def tagList = ct?.tags?.tokenize(",")
			println "tag list is $tagList"
			tagList.collect {
				if(message.contains(it)) {
					println "found matching tag $it in $message"
					complaint.addToTypes(ct)
				}
			}
		}
	}

}
