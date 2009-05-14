package resume

import org.apache.commons.lang.builder.CompareToBuilder
import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class ResumeEducationLink implements Serializable, Comparable<ResumeEducationLink> {

	static belongsTo = Resume

  	static searchable = {
      root false
	  education component: true
  	}

    Resume resume
    Education education
	
	boolean selected = false
	
    public String toString(){
        return "${education.what}"
    }

	public boolean equals( Object o ){
		if( !(o instanceof ResumeEducationLink) ){
			return false
		}
		
		if( o == this ){
			return true
		}
		
		ResumeEducationLink link = (ResumeEducationLink)o;
		return new EqualsBuilder()
		                 .append( this.resume, link.resume )
						 .append( this.education, link.education )
		                 .isEquals();		
	}
	
	public int hashCode(){
	   return new HashCodeBuilder(17, 37).
	       append(resume).
		   append(education).
	       toHashCode();		
	}
	
	public int compareTo(ResumeEducationLink link){
	   return new CompareToBuilder()
	       .append(this.resume, link.resume)
		   .append(this.education, link.education)
	       .toComparison();		
	}

}
