package resume

import org.apache.commons.lang.builder.CompareToBuilder
import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class Education implements Serializable, Comparable<Education>{

	static searchable = {
	    root false
	}

	static belongsTo = Person

	Person person
	String organization
	String courseCompleted
	Date completed

	public boolean equals( Object o ){
		if( !(o instanceof Education) ){
			return false
		}
		
		if( o == this ){
			return true
		}
		
		Education  education = (Education)o;
		return new EqualsBuilder()
		                 .append(this.person, education.person)
						 .append(this.organization, education.organization)
						 .append(this.courseCompleted,education.courseCompleted)
						 .append(this.completed, education.completed)
		                 .isEquals();		
	}
	
	public int hashCode(){
	   return new HashCodeBuilder(17, 37)
	       .append(this.person)
		   .append(this.organization)
		   .append(this.courseCompleted)
		   .append(this.completed)
	       .toHashCode();		
	}
	
	public int compareTo(Education education){
		
	   return new CompareToBuilder()
	       .append(this.person, education.person)
		   .append(this.organization, education.organization )
		   .append(this.courseCompleted, education.courseCompleted)
		   .append(this.completed, education.completed)
	       .toComparison();		
		
	}



}
