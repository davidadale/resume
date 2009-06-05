import resume.*


class CertificationController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests

    /* Having delete accept GET method until we get the ajax delete call working... */
    static allowedMethods = [delete:['POST', 'GET'], save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ certificationInstanceList: Certification.list( params ), certificationInstanceTotal: Certification.count() ]
    }

    def show = {
        def certificationInstance = Certification.get( params.id )

        if(!certificationInstance) {
            flash.message = "Certification not found with id ${params.id}"
            redirect(controller:"person", action:"home")
        }
        else { return [ certificationInstance : certificationInstance ] }
    }

    def delete = {
        def certificationInstance = Certification.get( params.id )
        if(certificationInstance) {
            try {
                certificationInstance.delete(flush:true)
                flash.message = "Certification ${params.id} deleted"
                redirect(controller:"person", action:"home")
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Certification ${params.id} could not be deleted"
                redirect(controller:"person", action:"home")
            }
        }
        else {
            flash.message = "Certification not found with id ${params.id}"
            redirect(controller:"person", action:"home")
        }
    }

    def edit = {
        def certificationInstance = Certification.get( params.id )

        if(!certificationInstance) {
            flash.message = "Certification not found with id ${params.id}"
            redirect(controller:"person", action:"home")
        }
        else {
            return [ certificationInstance : certificationInstance ]
        }
    }

    def update = {
        def certificationInstance = Certification.get( params.id )
        if(certificationInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(certificationInstance.version > version) {
                    
                    certificationInstance.errors.rejectValue("version", "certification.optimistic.locking.failure", "Another user has updated this Certification while you were editing.")
                    render(view:'edit',model:[certificationInstance:certificationInstance])
                    return
                }
            }
            certificationInstance.properties = params
            if(!certificationInstance.hasErrors() && certificationInstance.save()) {
                flash.message = "Certification ${params.id} updated"
                redirect(action:show,id:certificationInstance.id)
            }
            else {
                render(view:'edit',model:[certificationInstance:certificationInstance])
            }
        }
        else {
            flash.message = "Certification not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def certificationInstance = new Certification()
        certificationInstance.properties = params
        return ['certificationInstance':certificationInstance, 'personId': params.personId]
    }

    def save = {
        def person = Person.get(params.personId)
        if (person == null) {
            flash.message = "Unable to locate person for id " + params.personId
            redirect (action:"home", controller:"person")
        }
        def certificationInstance = new Certification(params)
        person.addToCerts(certificationInstance)
        if(!certificationInstance.hasErrors() && certificationInstance.save()) {
            flash.message = "Certification added"
           redirect(controller:"person", action:"home")
        }
        else {
            render(view:'create',model:[certificationInstance:certificationInstance])
        }
    }
}
