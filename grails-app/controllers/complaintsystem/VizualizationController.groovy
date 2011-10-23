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

        def geoCriteria = Complaint.createCriteria()

        def results = criteria.list() {
            projections {
                groupProperty("type")
                count("type")
            }
        }

        def geoResults = geoCriteria.list() {
            projections {
                groupProperty("utility")
                count("utility")
            }
        }

        def geoData = []

        geoResults.collect {
            //def location = Utility.findByName("${it[0]}")

            def utilityName = "${it[0]}"
            def utility = Utility.findByName(utilityName)

            geoData << [location: utility.location, issues: it[1]]
        }

        render (view : 'dashboard', model: [resultsInstance: results, geoResults: geoData])
    }
}
