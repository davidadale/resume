
import resume.*


class AwardController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests

    /* Having delete accept GET method until we get the ajax delete call working... */
    static allowedMethods = [delete:['POST', 'GET'], save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ awardInstanceList: Award.list( params ), awardInstanceTotal: Award.count() ]
    }

    def show = {
        def awardInstance = Award.get( params.id )

        if(!awardInstance) {
            flash.message = "Award not found with id ${params.id}"
            redirect (action:"home", controller:"person")
        }
        else { return [ awardInstance : awardInstance ] }
    }

    def delete = {
        def awardInstance = Award.get( params.id )
        if(awardInstance) {
            try {
                awardInstance.delete(flush:true)
                flash.message = "Award ${params.id} deleted"
                redirect (action:"home", controller:"person")
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Award ${params.id} could not be deleted"
                redirect (action:"home", controller:"person")
            }
        }
        else {
            flash.message = "Award not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def awardInstance = Award.get( params.id )

        if(!awardInstance) {
            flash.message = "Award not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ awardInstance : awardInstance ]
        }
    }

    def update = {
        def awardInstance = Award.get( params.id )
        if(awardInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(awardInstance.version > version) {
                    
                    awardInstance.errors.rejectValue("version", "award.optimistic.locking.failure", "Another user has updated this Award while you were editing.")
                    render(view:'edit',model:[awardInstance:awardInstance])
                    return
                }
            }
            awardInstance.properties = params
            if(!awardInstance.hasErrors() && awardInstance.save()) {
                flash.message = "Award ${params.id} updated"
                redirect (action:"home", controller:"person")
            }
            else {
                render(view:'edit',model:[awardInstance:awardInstance])
            }
        }
        else {
            flash.message = "Award not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        
        def awardInstance = new Award()
        awardInstance.properties = params      

        return ['awardInstance':awardInstance, 'personId': params.personId]
    }

    def save = {
        def person = Person.get(params.personId)
        if (person == null) {
            flash.message = "Unable to locate person for id " + params.personId
            redirect (action:"home", controller:"person")
        }
        def awardInstance = new Award(params)
        person.addToAwards(awardInstance)
        if(!awardInstance.hasErrors() && awardInstance.save()) {
            flash.message = "Award added"
            redirect(controller:"person", action:show,id:params.personId)
        }
        else {
            render(view:'create',model:[awardInstance:awardInstance])
        }
    }
}
