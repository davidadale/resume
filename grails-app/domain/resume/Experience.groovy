package resume;

import java.text.SimpleDateFormat

import org.apache.commons.lang.builder.CompareToBuilder
import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder


class Experience implements Serializable, Comparable<Experience> {

    static searchable = {
		root false
    }

    static SimpleDateFormat dateFormat = new SimpleDateFormat("MMM yyyy")

    static belongsTo = Person

    Person person

    String companyName

    String titleLine
    
    String role

    String summary

    Date dateStarted

    Date dateCompleted
    
    boolean ongoing

    List highlights

    List projects

   // List experiences

    static hasMany = [highlights:Highlight, projects:Project/* experiences:Experience*/];
    
    
    static constraints = {
        // TODO: These constraints not appropriate going forward.  Need to think about what to do here.
        // role(inList:["Business Analyst","Designer", "Developer", "Team Lead", "Project Manager"] )
        companyName(nullable: true)
        titleLine(nullable: true)
        summary(nullable: true)
        dateCompleted(nullable: true)
        ongoing(nullable: true)
        summary(nullable: true)
        projects(nullable:true)
    }

    static mapping = {
        columns{
            summary type:'text'
        }
    }

    static transients = ["formattedStartDate","formattedCompletionDate"]

    public String toString(){

        return "${titleLine}"
    }

	public boolean equals( Object o ){
		
		if( !(o instanceof Experience) ){
			return false
		}
		
		if( o == this ){
			return true
		}
		
		Experience  exp = (Project)o;
		return new EqualsBuilder()
				 .append(this.person, exp.person)
						 .append(this.titleLine, exp.titleLine)
						 .append(this.dateStarted, exp.dateStarted)
				 .isEquals();		
	}
	
	public int hashCode(){
	   return new HashCodeBuilder(17, 37)
	       .append(this.person)
		   .append(this.titleLine)
		   .append(this.dateStarted)
	       .toHashCode();		
	}
	
	public int compareTo(Experience exp){
	   return new CompareToBuilder()
	       .append(this.person, exp.person)
		   .append(this.titleLine, exp.titleLine )
		   .append(this.dateStarted, exp.dateStarted)
	       .toComparison();		
	}

    public String getFormattedStartDate(){
        return dateStarted == null ? "" : dateFormat.format( dateStarted )
    }

    public String getFormattedCompletionDate(){
        return dateCompleted == null ? "" : dateFormat.format( dateCompleted )
    }

}
