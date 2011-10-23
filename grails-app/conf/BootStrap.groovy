import complaintsystem.ComplaintType
import complaintsystem.Utility
import org.apache.shiro.crypto.hash.Sha256Hash
import complaintsystem.ShiroUser
import complaintsystem.ShiroRole
//import complaintsystem.SecRole
//import complaintsystem.SecUser
//import complaintsystem.SecUserSecRole

class BootStrap {

    def springSecurityService

    def init = { servletContext ->
        createComplaintTypes()
//
//        ComplaintType.list().each {
//            println it
//        }
        createUtilities()
//        createRoles()
        setupSecurity()
    }
    def destroy = {
    }

    def setupSecurity() {
        def wasrebRole = new ShiroRole(name: "WASREB").save()

//        def user = new ShiroUser(username: "user123", passwordHash: new Sha256Hash("password").toHex(), email: "admin@voiceh20.com")
//        user.addToPermissions("*:*")
//        user.save(failOnError: true)

        def wasreb = new ShiroUser(username: "wasreb", passwordHash: new Sha256Hash("password").toHex(), email: "wasreb@voiceh20.com")
        wasreb.addToPermissions("utility:*")
        wasreb.addToRoles(wasrebRole)
        wasreb.save(failOnError: true)

        def nwc = new ShiroUser(username: "nwc", passwordHash: new Sha256Hash("1234").toHex(), email: "nairobiwatercompany@voiceh20.com", utility: Utility.findByName("Nairobi Water Company"))
        nwc.addToPermissions("utility:*")
        nwc.save(failOnError: true)

    }

    def createRoles() {
//        def utilityRole = SecRole.findByAuthority('ROLE_UTILITY') ?: new SecRole(authority: 'ROLE_UTILITY').save()
//        def wasrebRole = SecRole.findByAuthority('ROLE_WASREB') ?: new SecRole(authority: 'ROLE_WASREB').save()
//        def adminRole = SecRole.findByAuthority('ROLE_ADMIN') ?: new SecRole(authority: 'ROLE_ADMIN').save()
//
//        def adminUser = SecUser.findByUsername('admin') ?: new SecUser(
//                username: 'admin',
//                password: springSecurityService.encodePassword('admin'),
//                email: 'admin@system.com', enabled: true).save(failOnError: true)
//
//        if (!adminUser.authorities.contains(adminRole)) {
//            SecUserSecRole.create adminUser, adminRole
//        }
//
//        def wasrebUser = SecUser.findByUsername('wasreb') ?: new SecUser(
//                username: 'wasreb',
//                email: 'admin@wasreb.com',
//                password: springSecurityService.encodePassword('wasreb'),
//                enabled: true).save(failOnError: true)
//
//        if (!wasrebUser.authorities.contains(wasrebRole)) {
//            SecUserSecRole.create wasrebUser, wasrebRole
//        }
//
//        def nairobiWaterUser = SecUser.findByUsername('nairobiwater') ?: new SecUser(
//                username: 'nairobiwater',
//                email: 'admin@nwc.co.ke',
//                password: springSecurityService.encodePassword('password'),
//                enabled: true).save(failOnError: true)
//
//        if (!nairobiWaterUser.authorities.contains(utilityRole)) {
//            SecUserSecRole.create nairobiWaterUser, utilityRole
//        }
    }

    def createComplaintTypes() {
        def wq = ComplaintType.findByDescription("Water Quality") ?: new ComplaintType(description: "Water Quality", menuIdx: 0, urgencyRating: 1, tags: "Dirty,Unclean").save()
        def dq = ComplaintType.findByDescription("Disconnection") ?: new ComplaintType(description: "Disconnection", menuIdx: 1, urgencyRating: 2, tags: "Disconnected").save()
        def lk = ComplaintType.findByDescription("Leakages") ?: new ComplaintType(description: "Leakages", menuIdx: 2, urgencyRating: 3, tags: "Leakages,Leak").save()
        def cr = ComplaintType.findByDescription("Corruption") ?: new ComplaintType(description: "Corruption", menuIdx: 3, urgencyRating: 4, tags: "Corruption").save()
        def wb = ComplaintType.findByDescription("Wrong Billing") ?: new ComplaintType(description: "Wrong Billing", menuIdx: 4, urgencyRating: 5, tags: "Bill,Money,Overcharged").save()
        def fm = ComplaintType.findByDescription("Faulty Meter") ?: new ComplaintType(description: "Faulty Meter", menuIdx: 5, urgencyRating: 6, tags: "Meter").save()
        def dp = ComplaintType.findByDescription("Delay in new application") ?: new ComplaintType(description: "Delay in new application", menuIdx: 6, urgencyRating: 7, tags: "Delay,application,new").save()
        def sb = ComplaintType.findByDescription("Sewer Bursts") ?: new ComplaintType(description: "Sewer Bursts", menuIdx: 7, urgencyRating: 1, tags: "Sewer,Bursts").save()
        def ot = ComplaintType.findByDescription("Other") ?: new ComplaintType(description: "Other", menuIdx: 8, urgencyRating: 9).save()

    }

    def createUtilities() {
        def nwc = Utility.findByName("Nairobi Water Company") ?: new Utility(name: "Nairobi Water Company", location: "Nairobi").save()
        def mwc = Utility.findByName("Kikuyu Water Company") ?: new Utility(name: "Kikuyu Water Company", location: "Kikuyu").save()
    }
}
