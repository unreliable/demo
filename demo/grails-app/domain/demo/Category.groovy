package demo

class Category {
	String categoryName
	
	static hasMany = [goods:Goods]

    static constraints = {
		categoryName(unique:true)
    }
}
