package complaintsystem


import org.apache.shiro.SecurityUtils

class HomeController {

    def index = {
        def currentUser = SecurityUtils.subject
        def primaryPrincipal = currentUser.principal.toString()

        def user = ShiroUser.findByUsername(primaryPrincipal)
		if (user) {
			def isWasreb = false
	//        if (user.roles.)
			user.roles.each {
				if (it.name == "WASREB") {
				   isWasreb = true
				}
			}

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

