package resume

class Company{
	
	String organizationName
	String phoneNumber
	String contactName
	
	static constraints = {
		organizationName(blank:false)
		phoneNumber(blank:false)
		contactName(blank:false)
	}
	
}