package complaintsystem

import grails.converters.JSON

class MessageController {

    def scaffold = true
	
    def receive = {
        if (params.task == "send") {
//            redirect(action: reply)
            def responses = Response.findAllByStatus("Pending")
            def messages = []
            responses.collect {
                messages << [to: it.phoneNumber, message: it.message]
                it.status = "Sent"
                it.save(flush: true)
            }
            sendResponseAsJson(messages)
        }
        else
        {
            def message = new Message(src: params.from, message: params.message).save(flush:true)

            if (Complaint.findByTicketNumber(params.message)) {
                def complaint = Complaint.findByTicketNumber(params.message)
//                def text = "Thanks for your enquiry. "
                def response = new Response(phoneNumber: params.from, message: "Thanks for your enquiry. Your ticket status is ${complaint.status}.", status: "Pending").save()
                render(contentType: "application/json") {
                    payload("success": "$status")
                }
            }
            else
            {
                def status = processMessage(message) ? true : false
                render(contentType: "application/json") {
                    payload("success" : "$status")
                }
            }
        }
    }
	
	def register = {
		def registrationMessage = "Please register in this format: [Fixed Address or Main Road], [Birth Year], [1 for Consumer, 2 for Vendor], [Account Number or 0000 if purchasing from vendor]"
		sendResponseAsJson(registrationMessage)
	}

	def sendResponseAsJson(message) {
		def send = [success: "true", task: "send", secret: "mahiu", messages:message]
		def payload = [payload:send]
		render payload as JSON
	}

	def reply = {
        def responses = Response.findAllByStatus("Pending")
        def messages = []
        responses.collect {
            messages << [to: it.phoneNumber, message: it.message]
            it.status = "Sent"
            it.save(flush: true)
        }
        sendResponseAsJson(messages)
	}

	def processMessage(Message m) {
		def customer
		def complaint
		def tm = splitMessage(m.message)
		def utility

		if(tm) {
			if(Customer.findByPhoneNumber(m.src) != null){
				customer = Customer.findByPhoneNumber(m.src)
			}else {
				customer = new Customer(phoneNumber:m.src, accountNumber:tm?.accNo).save(flush:true, failOnError:true)
			}
			
			if(tm?.location) {
				utility= Utility.findByLocationIlike(tm.location)
			}

			//generate ticket number
			def random = new Random()
			def ticketNumber = random.nextInt(100000)
			while(Complaint.findByTicketNumber(ticketNumber)) {
				println "running"
				ticketNumber = random.nextInt(100000)
			}
			complaint = new Complaint(affects:customer, content: tm?.complaint, source:m, utility: utility, ticketNumber: ticketNumber).save(flush:true, failOnError:true)
			setComplains(complaint, tm.complaint.toLowerCase())
			println "complaint ticket number is ${complaint.ticketNumber}"

            def response = new Response(phoneNumber: m.src, message: "Thank you for registering your complaint. Your complaint reference number is ${complaint.ticketNumber}").save(flush: true, failOnError: true)
            println "Response is ${response}"
			complaint
		} else {
			sendResponseAsJson("Error in message format")
		}
		
	}

	def setComplains(complaint, message) {
		boolean found
		ComplaintType.list(sort:"urgencyRating", order:"asc").each {ct ->
			if(!found) {
				def tagList = ct?.tags?.tokenize(",")
				tagList.collect {
					if(message.contains(it.toLowerCase())) {
						complaint.setType(ct)
						found = true
					}
				}
			}
		}
        if (!found)
        {
            def ot = ComplaintType.findByDescription("Other")
            complaint.setType(ot)
        }

	}

	def splitMessage(message) {
        def tm = message.tokenize("#")
		if(tm.size() == 1) {
			[]
		}else if(tm.size() >= 3)
            [accNo: tm[0], location: tm[1], complaint:tm[2]]
        else
            [accNo: tm[0], complaint:tm[1]]

    }
}
