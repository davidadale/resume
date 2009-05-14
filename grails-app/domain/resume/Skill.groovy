package resume

import org.apache.commons.lang.builder.CompareToBuilder
import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder


class Skill implements Serializable, Comparable<Skill>{

    static belongsTo = Person

    static searchable = {
        root false
        people reference:true
    }
 
    String name
    String description

    static hasMany = [people:Person]

	Integer numberOfPeopleWithSkill = new Integer(0)

	int compareTo(Skill skill){
	   return new CompareToBuilder()
	       .append(this.name, skill.name)
	       .toComparison();		
	}
	
	int hashCode(){
	   return new HashCodeBuilder(17, 37).
	       append(name).
	       toHashCode();		
	}
	
	boolean equals(Object o){
		
		if( !(o instanceof Skill) ){
			return false
		}
		
		if( o == this ){
			return true
		}
		
		Skill skill = (Skill)o;
		return new EqualsBuilder()
		                 .appendSuper(super.equals(o))
		                 .append(name, skill.name)
		                 .isEquals();
	}


    static mapping = {
        columns{
            description type:'text'
        }
    }
	static constraints = {
		numberOfPeopleWithSkill(nullable:true)
	}


    public String toString(){
        return "${name} - ${description}"
    }


}
