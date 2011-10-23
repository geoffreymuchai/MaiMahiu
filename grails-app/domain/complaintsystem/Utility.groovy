package complaintsystem

class Utility {

	String name
	String location
    String customerCareNumber

    //TODO: We need a bounds of sort. e.g someone may say they are in kikuyu but NWC covers the whole of nairobi
    //so even if we reverse geocode it wont be that simple
	
    static constraints = {
        name(nullable: false)
    }

    String toString() {
        return "${name}"
    }
}
