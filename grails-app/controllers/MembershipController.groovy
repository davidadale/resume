


class MembershipController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ membershipInstanceList: Membership.list( params ), membershipInstanceTotal: Membership.count() ]
    }

    def show = {
        def membershipInstance = Membership.get( params.id )

        if(!membershipInstance) {
            flash.message = "Membership not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ membershipInstance : membershipInstance ] }
    }

    def delete = {
        def membershipInstance = Membership.get( params.id )
        if(membershipInstance) {
            try {
                membershipInstance.delete(flush:true)
                flash.message = "Membership ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Membership ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Membership not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def membershipInstance = Membership.get( params.id )

        if(!membershipInstance) {
            flash.message = "Membership not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ membershipInstance : membershipInstance ]
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
                redirect(action:show,id:membershipInstance.id)
            }
            else {
                render(view:'edit',model:[membershipInstance:membershipInstance])
            }
        }
        else {
            flash.message = "Membership not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def membershipInstance = new Membership()
        membershipInstance.properties = params
        return ['membershipInstance':membershipInstance]
    }

    def save = {
        def membershipInstance = new Membership(params)
        if(!membershipInstance.hasErrors() && membershipInstance.save()) {
            flash.message = "Membership ${membershipInstance.id} created"
            redirect(action:show,id:membershipInstance.id)
        }
        else {
            render(view:'create',model:[membershipInstance:membershipInstance])
        }
    }
}
