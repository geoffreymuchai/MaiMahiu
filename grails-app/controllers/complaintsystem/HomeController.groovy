package complaintsystem


import org.apache.shiro.SecurityUtils

class HomeController {

    def index = {
        def currentUser = SecurityUtils.subject
        def primaryPrincipal = currentUser.principal.toString()

        def user = ShiroUser.findByUsername(primaryPrincipal)

        def isWasreb = false
//        if (user.roles.)
//        user.roles.each {
//            if (role == ShiroRole.findByName(""))
//        }

        def complaints = Complaint.findAllByUtility(user.utility)

        render(view: 'utility', model: [utilityInstance: user, complaintInstanceList: complaints])

    }

    def wasreb = {

    }
}

