import complaintsystem.ComplaintType
import complaintsystem.Utility

class BootStrap {

    def init = { servletContext ->
        createComplaintTypes()
    }
    def destroy = {
    }

    def createComplaintTypes() {
        def wq = ComplaintType.findByDescription("Water Quality") ?: new ComplaintType(description: "Water Quality", menuIdx: 0).save()
        def dq = ComplaintType.findByDescription("Disconnection") ?: new ComplaintType(description: "Disconnection", menuIdx: 1).save()
        def lk = ComplaintType.findByDescription("Leakages") ?: new ComplaintType(description: "Leakages", menuIdx: 2).save()
        def cr = ComplaintType.findByDescription("Corruption") ?: new ComplaintType(description: "Corruption", menuIdx: 3).save()
        def wb = ComplaintType.findByDescription("Wrong Billing") ?: new ComplaintType(description: "Wrong Billing", menuIdx: 4).save()
        def fm = ComplaintType.findByDescription("Faulty Meter") ?: new ComplaintType(description: "Faulty Meter", menuIdx: 5).save()
        def dp = ComplaintType.findByDescription("Delay in new application") ?: new ComplaintType(description: "Delay in new application", menuIdx: 6).save()
        def sb = ComplaintType.findByDescription("Sewer Bursts") ?: new ComplaintType(description: "Sewer Bursts", menuIdx: 7).save()
        def ot = ComplaintType.findByDescription("Other") ?: new ComplaintType(description: "Other", menuIdx: 8).save()

    }

    def createUtilities() {
        def nwc = Utility.findByName("Nairobi Water Company") ?: new Utility(name: "Nairobi Water Company", location: "Nairobi").save()
        def mwc = Utility.findByName("Kikuyu Water Company") ?: new Utility(name: "Kikuyu Water Company", location: "Kikuyu").save()
    }
}
