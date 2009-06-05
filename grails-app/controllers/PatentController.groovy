import resume.*


class PatentController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests

    /* Having delete accept GET method until we get the ajax delete call working... */
    static allowedMethods = [delete:['POST', 'GET'], save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ patentInstanceList: Patent.list( params ), patentInstanceTotal: Patent.count() ]
    }

    def show = {
        def patentInstance = Patent.get( params.id )

        if(!patentInstance) {
            flash.message = "Patent not found with id ${params.id}"
            redirect (action:"home", controller:"person")
        }
        else { return [ patentInstance : patentInstance ] }
    }

    def delete = {
        def patentInstance = Patent.get( params.id )
        if(patentInstance) {
            try {
                patentInstance.delete(flush:true)
                flash.message = "Patent ${params.id} deleted"
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Patent ${params.id} could not be deleted"
            }
        }
        else {
            flash.message = "Patent not found with id ${params.id}"
        }
        redirect (action:"home", controller:"person")
    }

    def edit = {
        def patentInstance = Patent.get( params.id )

        if(!patentInstance) {
            flash.message = "Patent not found with id ${params.id}"
            redirect (action:"home", controller:"person")
        }
        else {
            return [ patentInstance : patentInstance , 'personId': patentInstance.person.id]
        }
    }

    def update = {
        def patentInstance = Patent.get( params.id )
        if(patentInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(patentInstance.version > version) {
                    
                    patentInstance.errors.rejectValue("version", "patent.optimistic.locking.failure", "Another user has updated this Patent while you were editing.")
                    render(view:'edit',model:[patentInstance:patentInstance])
                    return
                }
            }
            patentInstance.properties = params
            if(!patentInstance.hasErrors() && patentInstance.save()) {
                flash.message = "Patent ${params.id} updated"
                redirect (action:"home", controller:"person")
            }
            else {
                render(view:'edit',model:[patentInstance:patentInstance , 'personId': patentInstance.person.id])
            }
        }
        else {
            flash.message = "Patent not found with id ${params.id}"
            redirect (action:"home", controller:"person")
        }
    }

    def create = {
        def patentInstance = new Patent()
        patentInstance.properties = params
        return ['patentInstance':patentInstance , 'personId': params.personId]
    }

    def save = {
        def person = Person.get(params.personId)
        if (person == null) {
            flash.message = "While saving license: Unable to locate person with id " + params.personId
            redirect (action:"home", controller:"person")
        }
        def patentInstance = new Patent(params)
        person.addToPatents(patentInstance)
        if(!patentInstance.hasErrors() && patentInstance.save()) {
            flash.message = "Patent ${patentInstance.id} created"
            redirect(action:show,id:patentInstance.id)
        }
        else {
            render(view:'create',model:[patentInstance:patentInstance])
        }
    }
}
