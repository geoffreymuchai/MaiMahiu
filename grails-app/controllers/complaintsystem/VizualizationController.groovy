package complaintsystem

class VizualizationController {

    def dashboard = {

//        def ctrl = new complaintsystem.HomeController()
        def numComplaints = Complaint.count()
//        import complaintsystem.*
//
//
//
//def criteria = Complaint.createCriteria()
//
//def results = criteria.list() {
//    projections {
//        groupProperty("type")
//        count("type")
//    }
//}
    }

    def index = {

        def criteria = Complaint.createCriteria()

        def results = criteria.list() {
            projections {
                groupProperty("type")
                count("type")
            }
        }
        render (view : 'dashboard', model: [resultsInstance: results])
    }
}
