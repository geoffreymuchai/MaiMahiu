package complaintsystem

import org.apache.shiro.SecurityUtils

class SecurityService {

    static transactional = true

    boolean isWasrebUser() {
        if (isLoggedIn()) {
            def user = getLoggedInUser()
			def isWasreb = false
			user.roles.each {
				if (it.name == "WASREB") {
				   isWasreb = true
				}
			}
            return isWasreb
        }
        return false
    }

    ShiroUser getLoggedInUser() {
        def currentUser = SecurityUtils.subject
        def primaryPrincipal = currentUser.principal.toString()

        def user = ShiroUser.findByUsername(primaryPrincipal)
		user
    }

    boolean isLoggedIn() {
        def currentUser = SecurityUtils.subject
        def primaryPrincipal = currentUser.principal.toString()

        def user = ShiroUser.findByUsername(primaryPrincipal)

        return user != null
    }
}
