import resume.*


class MembershipController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests

    /* Having delete accept GET method until we get the ajax delete call working... */
    static allowedMethods = [delete:['POST', 'GET'], save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ membershipInstanceList: Membership.list( params ), membershipInstanceTotal: Membership.count() ]
    }

    def show = {
        def membershipInstance = Membership.get( params.id )

        if(!membershipInstance) {
            flash.message = "Membership not found with id ${params.id}"
            redirect (action:"home", controller:"person")
        }
        else { return [ membershipInstance : membershipInstance ] }
    }

    def delete = {
        def membershipInstance = Membership.get( params.id )
        if(membershipInstance) {
            try {
                membershipInstance.delete(flush:true)
                flash.message = "Membership ${params.id} deleted"
                redirect (action:"home", controller:"person")
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Membership ${params.id} could not be deleted"
                redirect (action:"home", controller:"person")
            }
        }
        else {
            flash.message = "Membership not found with id ${params.id}"
            redirect (action:"home", controller:"person")
        }
    }

    def edit = {
        def membershipInstance = Membership.get( params.id )

        if(!membershipInstance) {
            flash.message = "Membership not found with id ${params.id}"
            redirect (action:"home", controller:"person")
        }
        else {
            return [ membershipInstance : membershipInstance, "personId":membershipInstance.person.id ]
        }
    }

    def update = {
        def membershipInstance = Membership.get( params.id )
        if(membershipInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(membershipInstance.version > version) {
                    
                    membershipInstance.errors.rejectValue("version", "membership.optimistic.locking.failure", "Another user has updated this Membership while you were editing.")
                    render(view:'edit',model:[membershipInstance:membershipInstance])
                    return
                }
            }
            membershipInstance.properties = params
            if(!membershipInstance.hasErrors() && membershipInstance.save()) {
                flash.message = "Membership ${params.id} updated"
                redirect (action:"home", controller:"person")
            }
            else {
                render(view:'edit',model:[membershipInstance:membershipInstance, "personId":membershipInstance.person.id])
            }
        }
        else {
            flash.message = "Membership not found with id ${params.id}"
            redirect (action:"home", controller:"person")
        }
    }

    def create = {
        def membershipInstance = new Membership()
        membershipInstance.properties = params
        return ['membershipInstance':membershipInstance, "personId":params.personId]
    }

    def save = {
        def person = Person.get(params.personId)
        if (person == null) {
            flash.message = "While saving license: Unable to locate person with id " + params.personId
            redirect (action:"home", controller:"person")
        }
        def membershipInstance = new Membership(params)
        person.addToMemberships(membershipInstance)
        if(!membershipInstance.hasErrors() && membershipInstance.save()) {
            flash.message = "Membership ${membershipInstance.id} created"
            redirect(action:show,id:membershipInstance.id)
        }
        else {
            render(view:'create',model:[membershipInstance:membershipInstance])
        }
    }
}
