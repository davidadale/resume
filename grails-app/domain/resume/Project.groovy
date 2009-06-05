package resume

import java.text.SimpleDateFormat

import org.apache.commons.lang.builder.CompareToBuilder
import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder


class Project implements Serializable, Comparable<Project> {

    static searchable = {
		root false
	}

    static SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy")

    static belongsTo = Experience

    Person person

    String companyName

    String titleLine
    
    String role

    String description

    Date dateStarted

    Date dateCompleted

    List highlights

    boolean ongoing
    
    static hasMany = [highlights:Highlight]
    /*
    static constraints = {
        role(inList:["Business Analyst","Designer", "Developer", "Team Lead", "Project Manager"] )
    }
    */

    static mapping = {
        columns{
            description type:'text'
        }
    }

    static transients = ["formattedStartDate","formattedCompletionDate"]

    public String toString(){

        return "${titleLine}"
    }

	public boolean equals( Object o ){
		
		if( !(o instanceof Project) ){
			return false
		}
		
		if( o == this ){
			return true
		}
		
		Project  project = (Project)o;
		return new EqualsBuilder()
		                 .append(this.person, project.person)
						 .append(this.titleLine, project.titleLine)
						 .append(this.dateStarted,project.dateStarted)
		                 .isEquals();		
	}
	
	public int hashCode(){
	   return new HashCodeBuilder(17, 37)
	       .append(this.person)
		   .append(this.titleLine)
		   .append(this.dateStarted)
	       .toHashCode();		
	}
	
	public int compareTo(Project project){
	   return new CompareToBuilder()
	       .append(this.person, project.person)
		   .append(this.titleLine, project.titleLine )
		   .append(this.dateStarted, project.dateStarted)
	       .toComparison();		
	}

    public String getFormattedStartDate(){
        return dateFormat.format( dateStarted )
    }

    public String getFormattedCompletionDate(){
        return dateFormat.format( dateCompleted )
    }


}
