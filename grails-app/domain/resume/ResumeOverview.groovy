package resume

class ResumeOverview implements Serializable {

    List highlights

    String summary 

    static hasMany = [highlights:Highlight]

    static constraints = {
        summary(nullable: true)
    }

    static belongsTo = Person
    
    Person person
}
