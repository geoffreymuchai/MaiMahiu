package complaintsystem

class ComplaintController {

    def scaffold = true
	def securityService

	def resolve = {
		def complaint = Complaint.findById(params.id)
		complaint.status = "Resolved"
		complaint.dateResolved = new Date()
		complaint.resolvedBy = securityService.getLoggedInUser()
		complaint.save(flush:true)
		def response = new Response(phoneNumber: complaint.affects.phoneNumber, message: "Your earlier complaint (reference  number ${complaint.ticketNumber}) has been resolved. If the problem still persists, resend your complaint").save(flush: true, failOnError: true)
		if(securityService.isWasrebUser()) {
			redirect controller: "home", action: "wasreb"
		} else {
			redirect controller: "home"
		}
	}
}
