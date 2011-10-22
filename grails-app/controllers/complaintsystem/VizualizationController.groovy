package complaintsystem

class VizualizationController {

    def dashboard = {

        def numComplaints = Complaint.count()

    }
}
