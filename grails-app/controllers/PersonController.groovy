

import org.jsecurity.SecurityUtils
import org.jsecurity.subject.Subject

import org.hibernate.FetchMode as FM

import resume.*

class PersonController {
    
	MailService mailService
	
 	def userAccountService

    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def home = {
        
		log.info "Getting logged in user information."
		Subject subject = SecurityUtils.getSubject()
		
		// if eager fetch is not used then a lazy init exception will be thrown by Hibernate
		// because the session bound to the Thread will be destroyed before sitemesh finishes
		// rendering the layout.
		log.debug "Creating a criteria object to eager fetch resumes for sitemesh layout."
		def c = Person.createCriteria()
		Person person = c.get{
			eq("username", subject.principal)
			fetchMode('resumes',FM.EAGER)
		}
		
		if( !person ){
            flash.message = "Person not found with id ${params.id}"
            redirect(action:list)			
		}
		
		// determine what tab should be selected on the home page
		def tabName = params.selectedTab?params.selectedTab:"skill"
		String tabSelected = "${tabName}TabSelected"
		log.debug "Tab that will be selected is ${tabSelected}"


		// setup the model data for the home page veiw
		log.debug "setting up model for view"
		def model = [  person : person,
                       resumes: person?.resumes,
                       skills: person?.skills,
                       projects: person?.projects,
                       education: person?.education]

		// additional attribute with the name of the curent selected tab and the value of ${true}
		log.debug "adding the tabSelected and inserting the value of true"
		model.put( tabSelected , "true")
		model.put( "showMyResumes","true")

		// render view
		log.debug "rendering person show view"
        render ( view: "show", model:model )

        
    }

	def emailResume = {
		mailService.sendResume()	
	}

    def showCentricResume = {
        Resume resume = Resume.get( params.id )
        render(view:"centric",model:[resume:resume])
    }

    def createResumeFlow = {

        start{
            action{
				// create a new resume
                Resume resume = new Resume()
				
				// get the current logged in person
				Person person = getLoggedInPerson()	
				
				// set the current person on the new resume			
				resume.person = person
				
				// save the new resume into the flow scope
                flow.resume = resume
            }
            on("error").to "homePage"
            on("success").to "step1"
        }

        step1{ // name
            on("previous").to "homePage"
            on("next"){ 
                 flow.resume.properties = params
            }.to "step2"
        }

        step2{ // profile
            on("previous").to "step1"
            on("next"){ 
                flow.resume.properties = params
                flash.skills = getLoggedInPerson().skills
            }.to "step3"
        }

        step3{ // select skills
            on("previous").to "step2"
            on("next"){ 
                flow.resume.properties = params
                flash.projects = getLoggedInPerson().projects
            }.to "step4"
        }

        step4{ // select projects

            on("previous"){
                flash.skills = getLoggedInPerson().skills
            }.to "step3"
            on("next"){
				flow.resume.properties = params
				flash.education = getLoggedInPerson().education
            }.to "step5"

        }

		step5{ // select education
			
			on("previous"){
				flash.projects = getLoggedInPerson().projects
			}.to "step4"
			on("next"){
				flow.resume.properties = params
				
			}.to "saveAndReturnHome"
			
		}

        saveAndReturnHome{
            action{

				try{

	                Resume resume = flow.resume

	                if( !resume.merge() ){
	                    resume.errors.each(){
	                        println it
	                    }
	                    return error()
	                }
					
				}catch( Exception e ){
					e.printStackTrace()
				}



            }
            on("success").to "homePage"
            on("error").to "home"
        }

        homePage{
            redirect(action:"home",controller:"person")
        }

    }

    def editResumeFlow = {
        start{
            action{
                Resume resume = Resume.get( params.id )
                flow.resume = resume
            }
            on("error").to "homePage"
            on("success").to "step1"
        }

        step1{ // name
            on("previous").to "homePage"
            on("next"){ 
                 flow.resume.properties = params
            }.to "step2"
        }

        step2{ // profile
            on("previous").to "step1"
            on("next"){ 
                flow.resume.properties = params
                flash.skills = getLoggedInPerson().skills
            }.to "step3"
        }

        step3{ // select skills
            on("previous").to "step2"
            on("next"){ 				
				flow.resume.properties = params
                flash.projects = getLoggedInPerson().projects
            
			}.to "step4"
        }

        step4{ // select projects

            on("previous"){
                flash.skills = getLoggedInPerson().skills
            }.to "step3"
            on("next"){
				flow.resume.properties = params
				flash.education = getLoggedInPerson().education
            }.to "step5"

        }

		step5{
			
			on("previous"){
				flash.projects = getLoggedInPerson().projects
			}.to "step4"
			on("next"){
				flow.resume.properties = params
				
			}.to "saveAndReturnHome"
			
		}

        saveAndReturnHome{
            action{

				try{
	                if( !flow.resume.merge(flush:true) ){
	 					flow.resume.errors.each(){
				             println it
				        }
						return error() 
	                }					
				}catch( Exception e ){
					e.printStackTrace()
				}


            }
            on("success").to "homePage"
            on("error").to "homePage"
        }

        homePage{
            redirect(action:"home",controller:"person")
        }


    }

    private Person getLoggedInPerson(){
        Subject subject = SecurityUtils.getSubject()
        Person person = Person.findByUsername( subject.principal )
        return person
		
    }

    def list = {
        if(!params.max) params.max = 10
        [ personList: Person.list( params ) ]
    }

    def editSkills = {

        [person:Person.get(params.id) , skills:Skill.list().collect{it}]

    }

    def updateSkills = {

        Person person = Person.get(params.id)
        person.properties = params

        if(!person.save(flush:true)){
            println "problem saving person"
        }
        redirect(action:home)
    }

    def show = {
        def person = Person.get( params.id )

        if(!person) {
            flash.message = "Person not found with id ${params.id}"
            redirect(action:list)
        }
        else { 
	
	
            person.resumes.each(){
                println it
            }
	
				return [ 
				person : person,
                resumes:person.resumes,
                skills: person.skills,
                projects: person.projects,
                education: person.education				
				] }
    }

    def delete = {
        def person = Person.get( params.id )
		
        if(person) {
            flash.message = "Person ${params.id} deleted"
			userAccountService.deleteUserAccount( person )
			redirect( action:"signOut",controller:"auth")
        }
        else {
            flash.message = "Person not found with id ${params.id}"
            redirect(controller:"person",action:"home")
        }


		

    }

	def addSkill = {
		Skill skill = Skill.get( params.id )
		getLoggedInPerson().addToSkills( skill )
		redirect(action:home)
	}

    def edit = {
        def person = Person.get( params.id )

        if(!person) {
            flash.message = "Person not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ person : person ]
        }
    }

    def update = {
        def person = Person.get( params.id )
        if(person) {
            person.properties = params
            if(!person.hasErrors() && person.save()) {
                flash.message = "Person ${params.id} updated"
                redirect(action:show,id:person.id)
            }
            else {
                render(view:'edit',model:[person:person])
            }
        }
        else {
            flash.message = "Person not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def person = new Person()
        person.properties = params
        return ['person':person]
    }

    def save = {
        def person = new Person(params)
        if(!person.hasErrors() && person.save(flush:true)) {
            flash.message = "Person ${person.id} created"
            redirect(action:show,id:person.id)
        }
        else {
            redirect(ation:home)
        }
    }
}
