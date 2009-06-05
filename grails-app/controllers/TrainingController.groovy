import resume.*


class TrainingController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ trainingInstanceList: Training.list( params ), trainingInstanceTotal: Training.count() ]
    }

    def show = {
        def trainingInstance = Training.get( params.id )

        if(!trainingInstance) {
            flash.message = "Training not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ trainingInstance : trainingInstance ] }
    }

    def delete = {
        def trainingInstance = Training.get( params.id )
        if(trainingInstance) {
            try {
                trainingInstance.delete(flush:true)
                flash.message = "Training ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Training ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Training not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def trainingInstance = Training.get( params.id )

        if(!trainingInstance) {
            flash.message = "Training not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ trainingInstance : trainingInstance ]
        }
    }

    def update = {
        def trainingInstance = Training.get( params.id )
        if(trainingInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(trainingInstance.version > version) {
                    
                    trainingInstance.errors.rejectValue("version", "training.optimistic.locking.failure", "Another user has updated this Training while you were editing.")
                    render(view:'edit',model:[trainingInstance:trainingInstance])
                    return
                }
            }
            trainingInstance.properties = params
            if(!trainingInstance.hasErrors() && trainingInstance.save()) {
                flash.message = "Training ${params.id} updated"
                redirect(action:show,id:trainingInstance.id)
            }
            else {
                render(view:'edit',model:[trainingInstance:trainingInstance])
            }
        }
        else {
            flash.message = "Training not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def trainingInstance = new Training()
        trainingInstance.properties = params
        return ['trainingInstance':trainingInstance]
    }

    def save = {
        def trainingInstance = new Training(params)
        if(!trainingInstance.hasErrors() && trainingInstance.save()) {
            flash.message = "Training ${trainingInstance.id} created"
            redirect(action:show,id:trainingInstance.id)
        }
        else {
            render(view:'create',model:[trainingInstance:trainingInstance])
        }
    }
}
