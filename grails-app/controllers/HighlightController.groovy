import resume.*

class HighlightController {

    def index = { }

    def delete = {
        def highlight = Highlight.get(params.id)
        if (highlight) {
            highlight.delete()
        } else {
            log.error "Unable to locate highlight for id " + params.id
        }

        if (params.from == 'overview') {
            redirect(controller:"resumeOverview", action:'edit',id:params.id)
        } else {
            redirect(controller:"experience",action:"edit",id:params.expid)
        }
        
    }
}
