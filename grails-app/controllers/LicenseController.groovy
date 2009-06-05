import resume.*


class LicenseController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    
    /* Having delete accept GET method until we get the ajax delete call working... */
    static allowedMethods = [delete:['POST', 'GET'], save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ licenseInstanceList: License.list( params ), licenseInstanceTotal: License.count() ]
    }

    def show = {
        def licenseInstance = License.get( params.id )

        if(!licenseInstance) {
            flash.message = "License not found with id ${params.id}"
            redirect(controller:"person", action:"home")
        }
        else { return [ licenseInstance : licenseInstance ] }
    }

    def delete = {
        def licenseInstance = License.get( params.id )
        if(licenseInstance) {
            try {
                licenseInstance.delete(flush:true)
                flash.message = "License ${params.id} deleted"
                redirect(controller:"person", action:"home")
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "License ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "License not found with id ${params.id}"
            redirect(controller:"person", action:"home")
        }
    }

    def edit = {
        def licenseInstance = License.get( params.id )

        if(!licenseInstance) {
            flash.message = "License not found with id ${params.id}"
            redirect(controller:"person", action:"home")
        }
        else {
            return [ licenseInstance : licenseInstance , 'personId': params.personId]
        }
    }

    def update = {
        def licenseInstance = License.get( params.id )
        if(licenseInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(licenseInstance.version > version) {
                    
                    licenseInstance.errors.rejectValue("version", "license.optimistic.locking.failure", "Another user has updated this License while you were editing.")
                    render(view:'edit',model:[licenseInstance:licenseInstance])
                    return
                }
            }
            licenseInstance.properties = params
            if(!licenseInstance.hasErrors() && licenseInstance.save()) {
                flash.message = "License ${params.id} updated"
                redirect(controller:"person", action:"home")
            }
            else {
                render(view:'edit',model:[licenseInstance:licenseInstance])
            }
        }
        else {
            flash.message = "License not found with id ${params.id}"
            redirect(controller:"person", action:"home")
        }
    }

    def create = {
        def licenseInstance = new License()
        licenseInstance.properties = params
        return ['licenseInstance':licenseInstance, 'personId': params.personId]
    }

    def save = {
        def person = Person.get(params.personId)
        if (person == null) {
            flash.message = "While saving license: Unable to locate person with id " + params.personId
            redirect (action:"home", controller:"person")
        }
        def licenseInstance = new License(params)
        person.addToLicenses(licenseInstance)
        if(!licenseInstance.hasErrors() && licenseInstance.save()) {
            flash.message = "License ${licenseInstance.id} saved"
            redirect(controller:"person", action:"home")
        }
        else {
            render(view:'create',model:[licenseInstance:licenseInstance])
        }
    }
}
