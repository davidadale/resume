
import org.jsecurity.crypto.hash.Sha1Hash
import resume.*

class UserAccountService{
	
	
	def createUserAccount = { person, account ->
		
		person.username = account.username
	
		def login = new JsecUser(username: account.username, passwordHash: new Sha1Hash( account.password ).toHex()  )
					
		def userRole = JsecRole.findWhere(name:"User")

		if( !person.save() ){
			log.error("failed saving person ${person}")
		}
		
		
		if( !account.save() ){
			log.error("failed saving account ${account}")
		}
		
		if( !login.save() ){
			log.error("failed saving JsecUser ${login}")
		}

		if( userRole ){
		 	new JsecUserRoleRel(user: login, role: userRole).save()			
		}

		
	}
	
	
	
	def deleteUserAccount = { person ->
		
		if( !person ){
			return 
		}
		
		Account account = Account.findByUsername( person.username )
		
		JsecUser user = JsecUser.findByUsername( person.username )

		JsecUserPermissionRel permissions = JsecUserPermissionRel.findWhere( "user.id":user.id )
		JsecUserRoleRel roles = JsecUserRoleRel.findWhere("user.id":user.id)
		
		if( permissions ){
			permissions*.delete()			
		}
		
		if( roles ){
			roles*.delete()
		}
		
		if( user){
			user.delete()						
		}

		
		if( account ){
			account.delete()			
		}

		if( person ){
			person.delete()			
		}

	}
	
	
	
	
}