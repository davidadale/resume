package resume

class Patent {

    static constraints = {
        number(nullable: true)
        title(nullable: true)
        dateAwarded(nullable: true)
        shortDescription(nullable: true)
        idustryField(nullable: true)
        patentHolders(nullable: true)
    }
    
    static belongsTo = Person

    Person person

    String number

    String title

    Date   dateAwarded

    boolean pending

    String shortDescription

    String idustryField

    String patentHolders

}
