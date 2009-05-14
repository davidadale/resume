class JsecRole implements Serializable{
    String name

    static constraints = {
        name(nullable: false, blank: false, unique: true)
    }
}
