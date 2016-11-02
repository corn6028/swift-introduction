/*:

 # Your shopping cart

 Again, it's your turn to create your shopping list.
 But this time, let's try to use `closures` which would be more straightforward.

 Assume that you want to buy following books:

 * "Digital Fortress" by "Dan Brown", $9.99
 * "Angels & Demons" by "Dan Brown", $17.00
 * "The Da Vinci Code" by "Dan Brown", $9.99
 * "Deception Point" by "Dan Brown", $17.00
 * "Harry Potter and the Goblet of Fire" by "J.K. Rowling", $12.99
 * "Harry Potter and the Order of Phoenix" by "J.K. Rowling", $12.99
 * "Harry Potter and the Deathly Hallows" by "J.K. Rowling", $14.99
 * "旅行與讀書" by "詹宏志", $12.00
 * "偵探研究" by "詹宏志", $10.00
 * "國宴與家宴" by "王宣一", $7.99

 Then, let's create a book store first:

 */

var bookStore = BookStore()

/*:

 Now start to feed data to the book store.

 You have to prepare following closures:
 1. A closure which returns the name of authors in a set or a list.
 _Note, you have to remove duplicated authors._
 2. A closure which returns the totoal price of books to purchase
 3. A closure which returns the number of books to buy
 4. A closure which returns a book with its title, author, and price by a given index.
    If the index is out of bound, return `nil`.

 */
let books: [[String: String]] = [
    ["author": "Dan Brown", "title": "Digital Fortress", "price": "9.99"],
    ["author": "Dan Brown", "title": "Angels & Demons", "price": "17.00"],
    ["author": "Dan Brown", "title": "The Da Vinci Code", "price": "9.99"],
    ["author": "Dan Brown", "title": "Deception Point", "price": "17.00"],
    ["author": "J.K. Rowling", "title": "Harry Potter and the Goblet of Fire", "price": "12.99"],
    ["author": "J.K. Rowling", "title": "Harry Potter and the Goblet of Fire", "price": "12.99"],
    ["author": "J.K. Rowling", "title": "Harry Potter and the Deathly Hallows", "price": "14.99"],
    ["author": "詹宏志", "title": "旅行與讀書", "price": "12.00"],
    ["author": "王宣一", "title": "國宴與家宴", "price": "7.99"],
]

//print(Set(books.flatMap{$0["author"]}))
//print(books.flatMap{$0["price"]}.flatMap{Double($0)}.reduce(0,+))

// A closure which returns the name of authors in a set.
bookStore.setDataSource(authorsGetter: { () -> Set<String> in return Set(books.flatMap{$0["author"]}) })

// A closure which returns the totoal price of books to purchase
bookStore.setDataSource(priceCalculator: { () -> Double in return books.flatMap{$0["price"]}.flatMap{Double($0)}.reduce(0,+) })

// A closure which returns the number of books and another closure returns a book by index
bookStore.setDataSource(bookGetter: { (bookIndex) -> Book? in
    guard bookIndex < books.count else {
        return nil
    }
    let book = books[bookIndex]
    guard let priceString = book["price"], let price = Double(priceString) else {
        print("Cannot get price for book at index \(bookIndex): No price")
        return nil
    }
    guard let title = book["title"] else {
        print("Cannot get title for book at index \(bookIndex): No title")
        return nil
    }
    guard let author = book["author"] else {
        print("Cannot get author for book at index \(bookIndex): No author")
        return nil
    }
    return (title, author, price)}
)

/*:

 Finally, let's show the book store shopping cart:

 */

bookStore.showInPlayground()

//: ---
//: [<- Previous](@previous) | [Next ->](@next)
