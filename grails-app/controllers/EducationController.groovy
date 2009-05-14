import resume.*

class EducationController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ educationList: Education.list( params ) ]
    }

    def show = {
        def education = Education.get( params.id )

        if(!education) {
            flash.message = "Education not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ education : education ] }
    }
 
	

    def delete = {
        def education = Education.get( params.id )
        if(education) {
            education.delete()
            flash.message = "Education ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Education not found with id ${params.id}"
            redirect(action:list)
        }
    }

	def close = {
		def params = [selectedTab:"education"]
		redirect(controller:"person",action:"home",params:params)
	}

    def edit = {
        def education = Education.get( params.id )

        if(!education) {
            flash.message = "Education not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ education : education ]
        }
    }

    def update = {
        def education = Education.get( params.id )
        if(education) {
            education.properties = params
            if(!education.hasErrors() && education.save()) {
                flash.message = "Education ${params.id} updated"
                redirect(action:show,id:education.id)
            }
            else {
                render(view:'edit',model:[education:education])
            }
        }
        else {
            flash.message = "Education not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def education = new Education()
        education.properties = params
        return ['education':education]
    }

    def save = {
        def education = new Education(params)
        if(!education.hasErrors() && education.save()) {
            flash.message = "Education ${education.id} created"
            redirect(action:show,id:education.id)
        }
        else {
            render(view:'create',model:[education:education])
        }
    }
}
