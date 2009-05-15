import resume.*

class ResumeOverviewController {

    def index = { }

    def edit = {
        println "overview id " + params.id
        def overview = ResumeOverview.get(params.id)

        if (!overview) {
            flash.message = "overview not found"
        }
        return [overview: overview]
    }

    def save = {
        saveOverview()
        redirect(action:'edit', id:params.id)
    }

     def saveOverview = {
        log.info 'entering save overview...'
        def overview = ResumeOverview.get(params.id)
        if(overview) {
            overview.properties = params
        }
        if (params.new_hightlight?.length() >0) {
                println 'adding new highlight'
                def highlight = new Highlight()
                highlight.text = params.new_hightlight
                if (overview.highlights == null)
		    overview.highlights = new ArrayList()
                overview.highlights.add(highlight)
        }
        if(!overview.hasErrors() && overview.save()) {
            println 'inspecting params...'
            params.each({ param ->
                    log.debug 'inspecting ' + param.key
                    if (param.key.indexOf('highlight_') == 0) {
                        log.debug 'found ' + param.key +  ' ==> ' + param.value
                        def hid = param.key.substring(param.key.indexOf('_')+1)
                        def highlight = Highlight.get(hid)
                        highlight.text = param.value
                        highlight.save()
                    }
            })
            flash.message = "Saved"

            return true
        }
        else {
            flash.message = "Save failed"
            return false
        }
     }
}
