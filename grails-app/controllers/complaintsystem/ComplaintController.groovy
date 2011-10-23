package complaintsystem

class ComplaintController {

    def scaffold = true

	def resolve = {
		println "params are $params"
		def complaint = Complaint.findById(params.id)
		complaint.status = "Resolved"
		complaint.dateResolved = new Date()

	}
}
