

import UIKit

//: # Basics

//: Constants and Variables

let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0
var x = 0.0, y = 0.0, z = 0.0

//: Type Annotations

var welcomeMessage: String
welcomeMessage = "Hello"
var red, green, blue: Double

//: Naming Constants and Variables

let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"

var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"

let languageName = "Swift"
//languageName = "Swift++" 
//this is a compile-time error - languageName cannot be changed

//: Printing Constants and Variables

//print(_:separator:terminator:)
print(friendlyWelcome)
print(friendlyWelcome, terminator: "")
//string interpolation
print("The current value of friendlyWelcome is \(friendlyWelcome)")

//: Comments
// this is a comment

/* this is also a comment,
but written over multiple lines */

/* this is the start of the first multiline comment
/* this is the second, nested multiline comment */
this is the end of the first multiline comment */

//: Semicolons

// semicolons are required if you want to write multiple separate statements on a single line
let cat = "🐱"; print(cat)

//: Type Safety and Type Inference

let meaningOfLife = 42 //Int
let pi = 3.14159 //Double
let anotherPi = 3 + 0.14159 //Double

//: Numeric Literals

let decimalInteger = 17
let binaryInteger = 0b10001       // 17 in binary notation
let octalInteger = 0o21           // 17 in octal notation
let hexadecimalInteger = 0x11     // 17 in hexadecimal notation

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

//: Numeric Type Conversion

//Integer and Floating-Point Conversion

let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi2 = Double(three) + pointOneFourOneFiveNine
let integerPi = Int(pi)

//: Type Aliases

//Type aliases define an alternative name for an existing type. 

typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min

//: Tuples

//Tuples group multiple values into a single compound value.
//Tuples are particularly useful as the return values of functions.

let http404Error = (404, "Not Found")

let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")

print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")

//: Optionals

// convertedNumber is inferred to be of type "Int?", or "optional Int"
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

var serverResponseCode: Int? = 404
serverResponseCode = nil

var surveyAnswer: String? // surveyAnswer is automatically set to nil

//: Forced Unwrapping


//First type
if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}

//Second type - Optional Binding
if let unwrappedConvertedNumber = convertedNumber{
    print("convertedNumber has an integer value of \(convertedNumber!).")
} else{
    //value convertedNumber was nil -> handle accordingly
}

//Third type
/*
guard let unwrappedConvertedNumber2 = convertedNumber else{
    //unwrapping failed, handle accordingly
    return
}
print("convertedNumber has an integer value of \(convertedNumber!).")
*/

//: Implicitly Unwrapped Optionals

let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // requires an exclamation mark

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // no need for an exclamation mark


//: Error Handling

func canThrowAnError() throws {
    // this function may or may not throw an error
}

do {
    try canThrowAnError()
    // no error was thrown
} catch {
    // an error was thrown
}

//: Assertions

//An assertion is a runtime check that a Boolean condition definitely evaluates to true.

let age = -3
assert(age <= 0, "A person's age cannot be less than zero")


//: # Basic Operators

//: Assignment Operator

let b = 10
var a = 5
a = b

//:Ternary Conditional Operator

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

//: Nil Coalescing Operator

//The nil coalescing operator (a ?? b) unwraps an optional a if it contains a value, or returns a default value b if a is nil 
//a != nil ? a! : b

let defaultColorName = "red"
var userDefinedColorName: String?

var colorNameToUse = userDefinedColorName ?? defaultColorName

//: Range Operators

// Closed Range Operator
//The closed range operator (a...b) defines a range that runs from a to b, and includes the values a and b. The value of a must not be greater than b.
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

//Half-Open Range Operator
//The half-open range operator (a..<b) defines a range that runs from a to b, but does not include b

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count

for i in 0...count-1{
     print("Person \(i + 1) is called \(names[i])")
}

//: # Strings and Characters

//Strings Are Value Types

//: String Literals

let someString = "Some string literal value"

var emptyString = ""               // empty string literal
var anotherEmptyString = String()  // initializer syntax

if emptyString.isEmpty {
    print("Nothing to see here")
}

var variableString = "Horse"
variableString += " and carriage"

//: Working with Characters

for character in "Dog".characters{
    print(character)
}

let exclamationMark: Character = "!"

let catCharacter: [Character] = ["C", "A", "T"]
let catString = String(catCharacter)

//: Concatenating Strings and Characters

let sparklingHeart = "\u{1F496}"


//: Accessing and Modifying a String

let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.endIndex.predecessor()]
greeting[greeting.startIndex.successor()]
let index = greeting.startIndex.advancedBy(7)
greeting[index]

for index in greeting.characters.indices {
    print("\(greeting[index]) ", terminator: "")
}

var welcome = "hello"
welcome.insert("!", atIndex: welcome.endIndex)
welcome.removeAtIndex(welcome.endIndex.predecessor())

//: # Collection Types

//Swift provides three primary collection types, known as arrays, sets, and dictionaries, for storing collections of values.

//: Arrays

//Creating an Empty Array
var someInts = [Int]()
print("size of someInts is: \(someInts.count)")
someInts.append(3)

//Creating an Array with a Default Value
var threeDoubles = [Double](count: 3, repeatedValue:0)

//Creating an Array by Adding Two Arrays Together
var anotherThreeDoubles = [Double](count: 3, repeatedValue: 2.5)
var sixDoubles = threeDoubles + anotherThreeDoubles

//Creating an Array with an Array Literal
var shoppingList: [String] = ["Milk", "Egg"]

//Accessing and Modifying an Array
print("The shopping list contains \(shoppingList.count) items.")

if shoppingList.isEmpty{
    print("The shopping list is empty.")
}else{
    print("The shopping list is not empty.")
}

shoppingList.append("Flour")
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

var firstItem = shoppingList[0]
shoppingList[0] = "Six eggs"

shoppingList[0...3] = ["Bananas", "Apples"]
shoppingList.insert("Sirup", atIndex: 0)
shoppingList.removeAtIndex(0)
shoppingList.removeLast()

//Iterating Over an Array
for item in shoppingList{
    print(item)
}

for (index, value) in shoppingList.enumerate(){
    print("Item \(index + 1): \(value)")
}

//: Sets

//A set stores distinct values of the same type in a collection with no defined ordering.
//The type of a Swift set is written as Set<Element>, where Element is the type that the set is allowed to store. 

//Creating and Initializing an Empty Set
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")
letters.insert("a")

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
//var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]

//Accessing and Modifying a Set
print("I have \(favoriteGenres.count) favorite music genres.")
favoriteGenres.insert("Rock")

//Performing Set Operations

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sort()
oddDigits.intersect(evenDigits).sort()
oddDigits.subtract(singleDigitPrimeNumbers).sort()
oddDigits.exclusiveOr(singleDigitPrimeNumbers).sort()

//Set Membership and Equality
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubsetOf(farmAnimals)
farmAnimals.isSupersetOf(houseAnimals)
farmAnimals.isDisjointWith(cityAnimals)

//: Dictionaries

var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

//Accessing and Modifying a Dictionary
print("The airports dictionary contains \(airports.count) items.")
airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}

airports["APL"] = "Apple International"
airports["APL"] = nil //removed
if let removedValue = airports.removeValueForKey("DUB") {
    print("The removed airport's name is \(removedValue).")
}else{}

for (airportCode, airportName) in airports{
    print("\(airportCode): \(airportName)")
}

let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)

//: # Control Flow

//: For Loops

//For-In
for index in 1...5{
    print(index)
}

let names2 = ["Anna", "Alex", "Brian", "Jack"]

for name in names2{
    print(name)
}

//For
for var index = 0; index < 3; ++index{
    print(index)
}

//: While Loops -  Snakes and Ladders game
/*
let finalSquare = 25
var board = [Int](count: finalSquare + 1, repeatedValue: 0)

board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0
while square < finalSquare{
    //roll the dice
    if ++diceRoll == 7 {diceRoll = 1}
    square += diceRoll
    if square < board.count{
        square += board[square]
    }
}
*/
print("Game Over")

//: Repeat-While

//The repeat-while loop in Swift is analogous to a do-while loop in other languages.

//: Switch

let someCharacter: Character = "e"
switch someCharacter{
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
"n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}

//: Where
//A switch case can use a where clause to check for additional conditions.

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

//: Control Transfer Statements

//Continue
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput.characters {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput.append(character)
    }
}
print(puzzleOutput)


//Break
//The break statement ends execution of an entire control flow statement immediately.


//Fallthrough
//entire switch statement completes its execution as soon as the first matching case is completed. 

//Early Exit
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    
    print("I hope the weather is nice in \(location).")
}

greet(["name": "Jane", "location": "Cupertino"])

//# Functions

//: Functions with Multiple Return Values

func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax([8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")

//: Function Parameter Names

//If you provide an external parameter name for a parameter, that external name must always be used when you call the function.
func someFunction(externalParameterName localParameterName: Int) {
    // function body goes here, and can use localParameterName
}

//Default Parameter Values
func someFunction(parameterWithDefault: Int = 12) {
    // function body goes here
    // if no arguments are passed to the function call,
    // value of parameterWithDefault is 12
}
someFunction(6) // parameterWithDefault is 6
someFunction() // parameterWithDefault is 12

//: Variadic Parameters
func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)

//In-Out Parameters

func swapTwoInts(inout a: Int, inout _ b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

// # Closures

//: The Sort Method

let names3 = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backwards(s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversed = names3.sort(backwards)

//Closure Expression Syntax

/*
Closure expression syntax has the following general form:

{ (parameters) -> return type in
    statements
}
*/

var reversed2 = names3.sort({(s1: String, s2: String) -> Bool in return s1 > s2})

var reversed5 = names3.sort({s1, s2 in return s1 > s2})

var reversed6 = names3.sort({s1, s2 in s1 > s2})

var reversed3 = names3.sort({return $0 > $1})

var reversed4 = names3.sort{$0 > $1}

var reversed7 = names.sort(>)

//: Trailing Closures

func someFunctionThatTakesAClosure(closure: () -> Void) {
    closure()
}

someFunctionThatTakesAClosure(){
    () -> Void in print("test")
}


//: Closures Are Reference Types

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)

let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()

//: Nonescaping Closures

func someFunctionWithNoescapeClosure(@noescape closure: () -> Void) {
    closure()
}

//A closure is said to escape a function when the closure is passed as an argument to the function, but is called after the function returns

//: Autoclosures

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// prints "5"

let customerProvider = { customersInLine.removeAtIndex(0) }
print(customersInLine.count)
// prints "5"

print("Now serving \(customerProvider())!")
// prints "Now serving Chris!"
print(customersInLine.count)
// prints "4"

// # Enumerations

//: Enumeration Syntax

enum compasPoint{
    case North
    case South
    case East
    case West
}

enum Planet {
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

var directionToHead = compasPoint.West
directionToHead = .South

//: Matching Enumeration Values with a Switch Statement

directionToHead = .South
switch directionToHead {
case .North:
    print("Lots of planets have a north")
case .South:
    print("Watch out for penguins")
case .East:
    print("Where the sun rises")
case .West:
    print("Where the skies are blue")
}

//: Associated Values

enum Barcode {
    case UPCA(Int, Int, Int, Int)
    case QRCode(String)
}

var productBarcode = Barcode.UPCA(8, 85909, 51226, 3)
productBarcode = .QRCode("ABCDEFGHIJKLMNOP")

switch productBarcode {
case .UPCA(let numberSystem, let manufacturer, let product, let check):
    print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
case .QRCode(let productCode):
    print("QR code: \(productCode).")
}

//Raw Values
enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}

// # Classes and Structures

struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution(width: 1600, height: 800)
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

//Structures and Enumerations Are Value Types
// all of the basic types in Swift—integers, floating-point numbers, Booleans, strings, arrays and dictionaries—are value types

//Classes Are Reference Types


//: # Properties

//: Stored properties
// a stored property is a constant or variable that is stored as part of an instance of a particular class or structure.

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

//: Lazy Stored Properties
//A lazy stored property is a property whose initial value is not calculated until the first time it is used.

class DataImporter {
    /*
    DataImporter is a class to import data from an external file.
    The class is assumed to take a non-trivial amount of time to initialize.
    */
    var fileName = "data.txt"
    // the DataImporter class would provide data importing functionality here
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    // the DataManager class would provide data management functionality here
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// the DataImporter instance for the importer property has not yet been created

print(manager.importer.fileName)
// the DataImporter instance for the importer property has now been created
// prints "data.txt"

//: Computed Properties
//They provide a getter and an optional setter to retrieve and set other properties and values indirectly.

struct Point{
    var x = 0.0, y = 0.0
}

struct Size{
    var width = 0.0, height = 0.0
}

struct Rect{
    var origin = Point()
    var size = Size()
    
    var center: Point{
        get{
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter){
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0),
    size: Size(width: 10.0, height: 10.0))

let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)

print("square.origin is now at (\(square.origin.x), \(square.origin.y))")

//Read-Only Computed Properties

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")

//: Property Observers
//Property observers observe and respond to changes in a property’s value.

//You have the option to define either or both of these observers on a property:
//  willSet is called just before the value is stored.
//  didSet is called immediately after the new value is stored.

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896


//: Type Properties
//Type Properties are static 

class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

print("Value is: \(SomeClass.computedTypeProperty)")


// # Methods
//Methods are functions that are associated with a particular type. 

//: Instance Methods
//Instance methods are functions that belong to instances of a particular class, structure, or enumeration.

class Counter {
    var count = 0
    func increment() {
        ++count
    }
    func incrementBy(amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

//: Assigning to self Within a Mutating Method
//Mutating methods can assign an entirely new instance to the implicit self property.

struct Point2 {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        self = Point2(x: x + deltaX, y: y + deltaY)
    }
}

// # Subscripts

//You use subscripts to set and retrieve values by index without needing separate methods for setting and retrieval. 

//Subscript Syntax

/*
subscript(index: Int) -> Int {
    get {
        // return an appropriate subscript value here
    }
    set(newValue) {
        // perform a suitable setting action here
    }
}
*/

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")

// # Inheritance
//: Defining a Base Class

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
        print("bb")
    }
}

//: Subclassing

class Bicycle: Vehicle{
    var hasBasket = false
    
    override init(){}
}
let bicycle = Bicycle()
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

//: Overriding

//Overriding Methods

class Train: Vehicle {
    override func makeNoise() {
        super.makeNoise()
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()
// prints "Choo Choo"

//: Overriding Properties

class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")

//: Overriding Property Observers

class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")

//: Preventing Overrides

//You can prevent a method, property, or subscript from being overridden by marking it as final
//You can mark an entire class as final by writing the final modifier before the class keyword in its class definition (final class). Any attempt to subclass a final class is reported as a compile-time error.

//: # Initialization

//: Initializers

class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

let namedMeat = Food(name: "Bacon")
// namedMeat's name is "Bacon"

let mysteryMeat = Food()
// mysteryMeat's name is "[Unnamed]"

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

let oneMysteryItem = RecipeIngredient()
print(oneMysteryItem.name)
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}

//: Failable Initializers

struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}

let someCreature = Animal(species: "Giraffe")

if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}

let anonymousCreature = Animal(species: "")
if anonymousCreature == nil {
    print("The anonymous creature could not be initialized")
}

//: Setting a Default Property Value with a Closure or Function

/*
class SomeClass {
    let someProperty: SomeType = {
        // create a default value for someProperty inside this closure
        // someValue must be of the same type as SomeType
        return someValue
        }()
}
*/

// # Deinitialization

class Bank {
    static var coinsInBank = 10_000
    static func vendCoins(var numberOfCoinsToVend: Int) -> Int {
        numberOfCoinsToVend = min(numberOfCoinsToVend, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receiveCoins(coins: Int) {
        coinsInBank += coins
    }
}

class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.vendCoins(coins)
    }
    func winCoins(coins: Int) {
        coinsInPurse += Bank.vendCoins(coins)
    }
    deinit {
        Bank.receiveCoins(coinsInPurse)
    }
}

var playerOne: Player? = Player(coins: 100)
print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
print("There are now \(Bank.coinsInBank) coins left in the bank")
playerOne!.winCoins(2_000)
print("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins")
print("The bank now only has \(Bank.coinsInBank) coins left")

playerOne = nil
print("PlayerOne has left the game")
print("The bank now has \(Bank.coinsInBank) coins")

// # Automatic Reference Counting

//Swift uses Automatic Reference Counting (ARC) to track and manage your app’s memory usage.

class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

// Because these variables are of an optional type (Person?, not Person), they are automatically initialized with a value of nil, and do not currently reference a Person instance.

reference1 = Person(name: "John Appleseed")
reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil

//If you break two of these strong references (including the original reference) by assigning nil to two of the variables, a single strong reference remains, and the Person instance is not deallocated:

reference3 = nil

//ARC does not deallocate the Person instance until the third and final strong reference is broken, at which point it is clear that you are no longer using the Person instance:



public struct Thermometer {
    public var temperature: Double
    public init(FloatLiteralConvertible temperature: Double) {
        self.temperature = temperature
    }
}

var thermometer: Thermometer = 56.8

