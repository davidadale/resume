package resume

class License {

    String licenseName

    Date licensingDate

    Person person

    static belongsTo = Person
    
    static constraints = {
        licensingDate(nullable: true)
    }
}
