
import resume.*


class SkillController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
	
		def c = Skill.createCriteria()
		def results = c {
			maxResults(10)
			order("numberOfPeopleWithSkill", "desc")
		}		
		
		def tags = [:]
		
		results.each(){
			tags.put(it.name,it.numberOfPeopleWithSkill)
		}
		
        [ tags: tags ]
    }

    def show = {
        def skill = Skill.get( params.id )

        if(!skill) {
            flash.message = "Skill not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ skill : skill ] }
    }

    def delete = {
        def skill = Skill.get( params.id )
        if(skill) {
            skill.delete()
            flash.message = "Skill ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Skill not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def skill = Skill.get( params.id )

        if(!skill) {
            flash.message = "Skill not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ skill : skill ]
        }
    }

    def update = {
        def skill = Skill.get( params.id )
        if(skill) {
            skill.properties = params
            if(!skill.hasErrors() && skill.save()) {
                flash.message = "Skill ${params.id} updated"
                redirect(action:show,id:skill.id)
            }
            else {
                render(view:'edit',model:[skill:skill])
            }
        }
        else {
            flash.message = "Skill not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

	def searchAJAX = {
		def skills = Skill.findAllByNameLike("%${params.query}%")

		        //Create XML response
		        render(contentType: "text/xml") {
			    results() {
			        skills.each { skill ->
				    result(){
				        name(skill.name)
		                        //Optional id which will be available in onItemSelect
		                        id(skill.id)
				    }
				}
		            }
		        }		
	}

    def create = {
        def skill = new Skill()
        skill.properties = params
        return ['skill':skill]
    }

    def save = {
        def skill = new Skill(params)
        if(!skill.hasErrors() && skill.save()) {
            flash.message = "Skill ${skill.id} created"
            redirect(action:list)
        }
        else {
            render(view:'create',model:[skill:skill])
        }
    }
    def saveContinue = {
        def skill = new Skill(params)
        if(!skill.hasErrors() && skill.save()) {
            flash.message = "Skill ${skill.id} created"
        }
		redirect(action:create)
    }
}
