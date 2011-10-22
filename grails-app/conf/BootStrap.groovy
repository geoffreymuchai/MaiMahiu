import complaintsystem.ComplaintType
import complaintsystem.Utility

class BootStrap {

    def init = { servletContext ->
        createComplaintTypes()
    }
    def destroy = {
    }

    def createComplaintTypes() {
        def wq = ComplaintType.findByDescription("Water Quality") ?: new ComplaintType(description: "Water Quality", menuIdx: 0, urgencyRating: 1, tags: "Dirty,Unclean").save()
        def dq = ComplaintType.findByDescription("Disconnection") ?: new ComplaintType(description: "Disconnection", menuIdx: 1, urgencyRating: 2, tags: "Disconnected").save()
        def lk = ComplaintType.findByDescription("Leakages") ?: new ComplaintType(description: "Leakages", menuIdx: 2, urgencyRating: 3, tags: "Leakages,Leak").save()
        def cr = ComplaintType.findByDescription("Corruption") ?: new ComplaintType(description: "Corruption", menuIdx: 3, urgencyRating: 4, tags: "Corruption").save()
        def wb = ComplaintType.findByDescription("Wrong Billing") ?: new ComplaintType(description: "Wrong Billing", menuIdx: 4, urgencyRating: 5, tags: "Bill,Money,Overcharged").save()
        def fm = ComplaintType.findByDescription("Faulty Meter") ?: new ComplaintType(description: "Faulty Meter", menuIdx: 5, urgencyRating: 6, tags: "Meter").save()
        def dp = ComplaintType.findByDescription("Delay in new application") ?: new ComplaintType(description: "Delay in new application", menuIdx: 6, urgencyRating: 7, tags: "Delay,application,new").save()
        def sb = ComplaintType.findByDescription("Sewer Bursts") ?: new ComplaintType(description: "Sewer Bursts", menuIdx: 7, urgencyRating: 1, "Sewer,Bursts").save()
        def ot = ComplaintType.findByDescription("Other") ?: new ComplaintType(description: "Other", menuIdx: 8, urgencyRating: 9).save()

    }

    def createUtilities() {
        def nwc = Utility.findByName("Nairobi Water Company") ?: new Utility(name: "Nairobi Water Company", location: "Nairobi").save()
        def mwc = Utility.findByName("Kikuyu Water Company") ?: new Utility(name: "Kikuyu Water Company", location: "Kikuyu").save()
    }
}
