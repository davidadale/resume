package resume

class Account implements Serializable {
	
	String username
	String password
	String verifiedPassword
	
	static constraints = {
		username(blank:false)
		password(blank:false)
		verifiedPassword(blank:false)
	}
	
	static transients = ["password","verifiedPassword","passwordVerified"]
	
	public boolean isPasswordVerified(){
		return password == verifiedPassword
	}
	
}