package complaintsystem

import org.apache.shiro.SecurityUtils

class HomeController {

    def index = {
        def currentUser = SecurityUtils.subject
        def primaryPrincipal = currentUser.principal.toString()

        def user = ShiroUser.findByUsername(primaryPrincipal)

        render(view: 'utility', model: [utilityInstance: user])
    }
}
