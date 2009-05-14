
import resume.*


class ResumeController{
	
	MailService mailService

    def show = {
        Resume resume = Resume.get( params.id )
        render(view:"centric",model:[resume:resume])
    }	

	def email = {
		mailService.sendResume( Resume.get(params.id),params.emailTo, params.subject, params.message )
		render 'resume sent'
	}
	
	def emailAll = {
		
		println "email ALL called"
		
		def ids = params.resumeId
		mailService.sendResumes( ids )
		
		render 'resumes sent'
		
	}
	
	def download = {
		println "still calling download"
		render 'hello universe'
	}
	
	
	def delete = {
		Resume resume = Resume.get( params.id )
		resume.delete()
        redirect(controller:"person",action:"home")		
	}
	
}