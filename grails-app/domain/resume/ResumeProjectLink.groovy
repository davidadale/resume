package resume


import org.apache.commons.lang.builder.CompareToBuilder
import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class ResumeProjectLink implements Serializable, Comparable<ResumeProjectLink>{

	static belongsTo = Resume

	static searchable = {
	    root false
	 project component: true
	}

    Resume resume
    Project project
	
	boolean selected = false

    public String toString(){
        return "${project.titleLine}"
    }

	public boolean equals(Object o){
		if( !(o instanceof ResumeProjectLink) ){
			return false
		}
		
		if( o == this ){
			return true
		}
		
		ResumeProjectLink link = (ResumeProjectLink)o;
		return new EqualsBuilder()
		                 .append( this.resume, link.resume )
						 .append( this.project, link.project )
		                 .isEquals();		
	}
	
	public int hashCode(){
	   return new HashCodeBuilder(17, 37).
	       append(resume).
		   append(project).
	       toHashCode();		
	}
	
	public int compareTo( ResumeProjectLink link ){

	   return new CompareToBuilder()
	       .append(this.resume, link.resume)
		   .append(this.project, link.project)
	       .toComparison();
		
	}
}
