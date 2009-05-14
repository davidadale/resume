package resume

import org.apache.commons.lang.builder.CompareToBuilder
import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class ResumeSkillLink implements Serializable, Comparable<ResumeSkillLink>{

    static belongsTo = Resume

    Resume resume
    Skill skill

    static searchable = {
    	root false
		skill component: true
    }

	//static constraints = {
	//	resume( nullable: true )
	//}

	boolean selected = false
	
    public String toString(){
        return "${skill.name}"
    }
	
	int compareTo(ResumeSkillLink link){
	   return new CompareToBuilder()
	       .append(this.resume, link.resume)
		   .append(this.skill, link.skill)
	       .toComparison();		
	}
	
	int hashCode(){
	   return new HashCodeBuilder(17, 37).
	       append(resume).
		   append(skill).
	       toHashCode();		
	}
	
	boolean equals(Object o){
		
		if( !(o instanceof ResumeSkillLink) ){
			return false
		}
		
		if( o == this ){
			return true
		}
		
		ResumeSkillLink link = (ResumeSkillLink)o;
		return new EqualsBuilder()
		                 .append( this.resume, link.resume )
						 .append( this.skill, link.skill )
		                 .isEquals();
	}
}
