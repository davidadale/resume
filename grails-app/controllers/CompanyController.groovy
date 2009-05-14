import resume.*

class CompanyController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ companyInstanceList: Company.list( params ) ]
    }

    def show = {
        def companyInstance = Company.get( params.id )

        if(!companyInstance) {
            flash.message = "Company not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ companyInstance : companyInstance ] }
    }

    def delete = {
        def companyInstance = Company.get( params.id )
        if(companyInstance) {
            companyInstance.delete()
            flash.message = "Company ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Company not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def companyInstance = Company.get( params.id )

        if(!companyInstance) {
            flash.message = "Company not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ companyInstance : companyInstance ]
        }
    }

    def update = {
        def companyInstance = Company.get( params.id )
        if(companyInstance) {
            companyInstance.properties = params
            if(!companyInstance.hasErrors() && companyInstance.save()) {
                flash.message = "Company ${params.id} updated"
                redirect(action:show,id:companyInstance.id)
            }
            else {
                render(view:'edit',model:[companyInstance:companyInstance])
            }
        }
        else {
            flash.message = "Company not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def companyInstance = new Company()
        companyInstance.properties = params
        return ['companyInstance':companyInstance]
    }

    def save = {
        def companyInstance = new Company(params)
        if(!companyInstance.hasErrors() && companyInstance.save()) {
            flash.message = "Company ${companyInstance.id} created"
            redirect(action:show,id:companyInstance.id)
        }
        else {
            render(view:'create',model:[companyInstance:companyInstance])
        }
    }
}
