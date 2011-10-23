package complaintsystem


import org.apache.shiro.SecurityUtils

class HomeController {

    def securityService

    def index = {
        if (securityService.isLoggedIn())  {
            def user = securityService.getLoggedInUser()
            def isWasreb = securityService.isWasrebUser()

			if (!isWasreb) {
				def complaints = Complaint.findAllByUtility(user.utility)

				render(view: 'utility', model: [utilityInstance: user, complaintInstanceList: complaints])
			}
			else
			{
				redirect(action: wasreb)
			}

		}
		else {
			render(view: '/index')
		}
        

    }

    def wasreb = {
		def pendingIssuesInstanceList = Complaint.findAllByStatusNotEqual("Resolved", [sort:"dateCreated", order:"desc"])
		def solvedIssuesInstanceList = Complaint.findAllByStatus("Resolved", [sort:"dateCreated", order:"desc"])
		[pendingIssuesInstanceList: pendingIssuesInstanceList, solvedIssuesInstanceList: solvedIssuesInstanceList]
    }
}

