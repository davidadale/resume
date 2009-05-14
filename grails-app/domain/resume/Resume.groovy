package resume

import org.apache.commons.lang.builder.CompareToBuilder
import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class Resume implements Serializable, Comparable<Resume>{

    static searchable = {
        skills component: true
        projects component: true
        education component: true
		person component: true
    }    

    static belongsTo = Person
    Person person

    String name
    String profile

    static hasMany = [skills:ResumeSkillLink,projects:ResumeProjectLink,education:ResumeEducationLink]

    static constraints = {
        profile(length:100..4000,maxSize:4000)
    }


    static mapping = {
		skills cascade:"all-delete-orphan"
		projects cascade: "all-delete-orphan"
		education cascade: "all-delete-orphan"
        columns{
            profile type:'text'
        }
        
    }

    public void setSelectedSkillsById(List<Long> ids){

		def selected = ids.collect{ id ->
			new ResumeSkillLink(resume:this,skill:Skill.get( id ))
		}
		
		if( this.skills ){
			def diff = this.skills - selected
			diff?.each(){ this.removeFromSkills( it ) }
			diff = selected - this.skills
			diff?.each(){ this.addToSkills( it ) }
		}else{
			selected.each(){ this.addToSkills( it ) }
		}

    }

    public void setSelectedProjectsById( List<Long> ids ){
		
		def selected = ids.collect{ id ->
			new ResumeProjectLink(resume:this,project:Project.get(id))
		}
		
		if(this.projects){
			def diff = this.projects - selected
			diff?.each(){this.removeFromProjects(it)}
			diff = selected - this.projects
			diff?.each(){this.addToProjects(it)}
		}else{
			selected.each(){this.addToProjects(it)}
		}
    }

    public void setSelectedEducationById( List<Long> ids ){
		
		def selected = ids.collect{ id ->
			new ResumeEducationLink(resume:this,education:Education.get(id))
		}
		
		if(this.education){
			def diff = this.education - selected
			diff?.each(){this.removeFromEducation(it)}
			diff = selected - this.education
			diff?.each(){this.addToEducation(it)}
		}else{
			selected.each(){this.addToEducation( it )}
		}

    }

	int compareTo(Resume resume){
	   return new CompareToBuilder()
	       .append(this.person, resume.person)
		   .append(this.name, resume.name )
	       .toComparison();		
	}
	
	int hashCode(){
	   return new HashCodeBuilder(17, 37).
	       append(this.person).
		   append(this.name).
	       toHashCode();		
	}
	
	boolean equals(Object o){
		
		if( !(o instanceof Resume) ){
			return false
		}
		
		if( o == this ){
			return true
		}
		
		Resume  resume = (Resume)o;
		return new EqualsBuilder()
		                 .append(this.person, resume.person)
						 .append(this.name, resume.name)
		                 .isEquals();
	}

	String toString(){
		return "${person.fullName}"
	}


}
