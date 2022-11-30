import UIKit
//: ## Structures
struct Dog {
    var breed: String
    var colour: UIColor
    var age: Int
    var size: String
    var barkSound: String
    func bark() -> String {
        return barkSound
    }
}
/*:
 We distinguish different instances by property differences.
 Below we declare 4 instances of dog:
*/
let blackLabrador = Dog(breed: "Labrador", colour: .black, age: 5, size: "large", barkSound: "bork")
print(blackLabrador.bark())

let yellowLabrador = Dog(breed: "Poodle", colour: .yellow, age: 2, size: "large", barkSound: "ruff")
print(yellowLabrador.bark())

let irishSetter = Dog(breed: "Irish Setter", colour: .red, age: 3, size: "medium", barkSound: "yip")
print(irishSetter.bark())
//: ## Classes in action
class Doggie {
    init(breed: String, colour: UIColor, age: Int, size: String) {
        self.breed = breed
        self.colour = colour
        self.age = age
        self.size = size
    }
    
    var breed: String
    var colour: UIColor
    var age: Int
    var size: String
    func bark() -> String {
        //default sound is woof
        return "woof"
    }
}
/*:
 Class specialisation is achieved via sub-classing. By sub-classing Doggie, we can provide 'specialised' instances of the base class.
    Labrador, IrishSetter and Poodle are specialisations of Doggie. We provide a memberwise intializer to create instances of each type, allowing us the opportunity to set the breed correctly.
*/
class Labrador: Doggie {
    init(colour: UIColor, age: Int, size: String) {
        super.init(breed: "Labrador", colour: colour, age: age, size: size)
    }
    override func bark() -> String {
        return "ruff"
    }
}

class IrishSetter: Doggie {
    init(colour: UIColor, age: Int, size: String) {
        super.init(breed: "Irish Setter", colour: colour, age: age, size: size)
    }
    override func bark() -> String {
        return "yip"
    }
}

class Poodle: Doggie {
    init(colour: UIColor, age: Int, size: String) {
        super.init(breed: "Poodle", colour: colour, age: age, size: size)
    }
    override func bark() -> String {
        return "ruff"
    }
}

let dogOne = Labrador(colour: .black, age: 5, size: "large")
let dogTwo = Poodle(colour: .black, age: 5, size: "large")
let dogThree = IrishSetter(colour: .red, age: 3, size: "medium")
let dogFour = Doggie(breed: "Bulldog", colour: .brown, age: 9, size: "medium")

//: Now, lets make them bark by declaring an Array of Doggies.
let dogs = [dogOne, dogTwo, dogThree, dogFour]

for dog in dogs {
    //base class
    if let _ = dog as? Labrador {
        //specialise
        print ("** Labrador here! **")
    } else if let _ = dog as? Poodle {
        //specialise
        print ("** Poodle here! **")
    } else if let _ = dog as? IrishSetter {
        //specialise
        print ("** Irish Setter here! **")
    } else {
        //Base class - Doggie
        print ("** \(dog.breed) here! **")
    }
    print(dog.bark())
}

