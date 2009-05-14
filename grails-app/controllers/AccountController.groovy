
import resume.*

class AccountController{
	
    def userAccountService
	
    def index = { redirect(uri:"/account/registration") }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ projectList: Project.list( params ) ]
    }	
	
    def registrationFlow = {
		
        accountInfo {
			
            on("next"){
				
                flow.account = new Account( params )
				
                if( !flow.account.passwordVerified ){
                    flash.message = "passwords need to match"
                    return error()
                }
				
                flow.account.validate() ? success() : error()
			
            }.to "userInfo"
			
			
        }
		
        userInfo {
			
            on("finish"){
				
                Person person = new Person( params )
                Account account = flow.account
				
                userAccountService.createUserAccount( person, account )
				
                def model = ["username":account.username,"password":account.password]
				
                //redirect(action:"signIn",controller:"auth", params:model)
				
            }.to "endFlow"
            on("quit").to "quitFlow"
			
        }
		
		
        endFlow{
            redirect(action:'home',controller:'person')
        }
		
        quitFlow {
            redirect(action:'home',controller:'person')
        }
		
    }
	
	
	
}