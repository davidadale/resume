package resume

import org.apache.commons.lang.builder.CompareToBuilder
import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class Person implements Serializable, Comparable<Person>{

  static searchable = {
      root false
  }

    String firstName
    String lastName
    String email
    String phoneNumber
    String address
    String city
    String state
    String zip

    String username

    static hasMany = [projects: Project,education:Education,skills:Skill,resumes:Resume]
    static transients = ["fullName"]


    public void setSelectedSkillsById(List ids){
        this.skills = ids.collect{
           Skill s = Skill.get( it )
           return s
        }
    }

    /**
     * A convience property for returning the
     * full name of the individual.
     */
    public String getFullName(){
        if(firstName && lastName){
            return "${firstName} ${lastName}"
        }
        return ""
    }

	int compareTo(Person person){
	   return new CompareToBuilder()
	       .append(this.username, person.username)
	       .toComparison();		
	}
	
	int hashCode(){
	   return new HashCodeBuilder(17, 37).
	       append(username).
	       toHashCode();		
	}
	
	boolean equals(Object o){
		
		if( !(o instanceof Person) ){
			return false
		}
		
		if( o == this ){
			return true
		}
		
		Person person = (Person)o;
		return new EqualsBuilder()
		                 .append(this.username, person.username)
		                 .isEquals();
	}


    public String toString(){
        return "${getFullName()}"
    }
}
