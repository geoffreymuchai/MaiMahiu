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
		if(securityService.isWasrebUser()) {
			redirect controller: "home", action: wasreb
		} else {
			redirect controller: "home"
		}
	}
}
