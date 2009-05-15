package resume

class ResumeOverview implements Serializable {

    List highlights

    String summary 

    static hasMany = [highlights:Highlight]

    Person person
}
