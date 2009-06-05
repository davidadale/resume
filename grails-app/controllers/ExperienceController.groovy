import resume.*

import org.jsecurity.SecurityUtils
import org.jsecurity.subject.Subject

import org.hibernate.FetchMode as FM

class ExperienceController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests

    /* Having delete accept GET method until we get the ajax delete call working... */
    static allowedMethods = [delete:['POST', 'GET'], save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ experienceList: Experience.list( params ) ]
    }

    def show = {
        def experience = Experience.get( params.id )

        if(!experience) {
            flash.message = "Experience not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ experience : experience ] }
    }

    def delete = {
        def experience = Experience.get( params.id )
        if(experience) {
            personid = experience.person.id
            experience.delete()
            flash.message = "Experience ${params.id} deleted"
            redirect(controller:"person",action:"show", id:experience.person.id)
        }
        else {
            redirect(controller:"person",action:"home")
        }
    }

    def edit = {
        def experience = Experience.get( params.id )

        if(!experience) {
            experience = new Experience()
            experience.properties = params
        }
        //if (experience.projects == null) experience.projects = new ArrayList();
        
        return [ experience : experience, personid:params.personid ]
    }

    def update = {
        def experience = Experience.get( params.id )
        if(experience) {
            experience.properties = params
            if(!experience.hasErrors() && experience.save()) {
                flash.message = "Experience ${params.id} updated"
                redirect(action:show,id:experience.id)
            }
            else {
                render(view:'edit',model:[experience:experience])
            }
        }
        else {
            flash.message = "Experience not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
	redirect(action:edit,id:params.id, params:['person.id':params."person.id"])
    }

    def saveAjax = {
        if (saveExperience()) {
            render(text:"<result>ok</result>",contentType:"text/xml",encoding:"UTF-8")
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR)
        }
    }


    def save = {
        println 'entering save... for experience ' + params.id + ' and person ' + params.personid
        def experience = Experience.get( params.id )
        if(experience) {
            experience.properties = params
        } else {
            experience = new Experience(params)          
            experience.person = Person.get(params.personid)
            if (experience.person.experiences == null) {
                experience.person.experiences = new ArrayList()
            }
            experience.person.experiences.add(experience)
        }
        if (params.new_hightlight?.length() >0) {
                println 'adding new highlight'
                def highlight = new Highlight()
                highlight.text = params.new_hightlight
                if (experience.highlights == null)
		    experience.highlights = new ArrayList()
                experience.highlights.add(highlight)
        }
        if(!experience.hasErrors() && experience.save()) {
            println 'inspecting params...'
            params.each({ param ->
                    println 'inspecting ' + param.key
                    if (param.key.indexOf('highlight_') == 0) {
                        println 'found ' + param.key +  ' ==> ' + param.value
                        def hid = param.key.substring(param.key.indexOf('_')+1)
                        println "found " + hid
                        def highlight = Highlight.get(hid)
                        highlight.text = param.value
                        highlight.save()
                    }        
            })            
            flash.message = "Saved"

            if (!params.id)  // might have been new experience, so put id in params for forwards
                params.id = experience.id
                
            
        }
        else {
            flash.message = "Save Failed: "
            experience.errors.each {
                println it
            }
        }
        redirect(action:edit,id:params.id)
    }
    
    
}
