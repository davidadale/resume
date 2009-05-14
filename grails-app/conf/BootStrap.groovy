import org.jsecurity.crypto.hash.Sha1Hash

class BootStrap {

     def init = { servletContext ->

		def admin = JsecUser.findByUsername("admin")

		if( !admin ){
			admin = new JsecUser( username: "admin", passwordHash: new Sha1Hash("admin").toHex()).save()
		}


		def adminRole = JsecRole.findWhere(name:"Administrator")

		if( !adminRole ){
			adminRole = new JsecRole(name: "Administrator").save()
			new JsecUserRoleRel(user: admin, role: adminRole).save()
		}

		def userRole = JsecRole.findWhere(name:"User")

		if( !userRole ){
			userRole = new JsecRole(name:"User").save()
		}


     }
     def destroy = {
     }
} 