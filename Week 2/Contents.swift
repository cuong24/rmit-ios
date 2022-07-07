import Foundation
// // Q1
// func dayOfTheWeek(day: Int) -> String{
//     switch day{
//         case 1: 
//             return "Monday"
//         case 2:
//             return "Tuesday"
//         case 3:
//             return "Wednesday"
//         case 4:
//             return "Thursday"
//         case 5:
//             return "Friday"
//         case 6:
//             return "Saturday"
//         case 7:
//             return "Sunday"
//         default: 
//             return "Unknown"
//     }
// }

// print("Enter a day of a week (1-7):")
// if let dayString = readLine(){
//     if let dayInteger = Int(dayString){
//         if dayInteger <= 7 && dayInteger >= 1{
//             print("The day is \(dayOfTheWeek(day: dayInteger))")
//         } else {
//             print("Error: the correct format of day must be 1-7!")
//         }
//     } else {
//         print("Error: the correct format of day must be 1-7!")
//     }
// }

//Q2
// var funFactsRMIT: [String: Int] = [
// "numberOfStudents" : 6500,
// "numberScholarships": 1100,
// "numberOfGraduates": 12000,
// "numberMasterPrograms": 3,
// "numberPhDPrograms": 3,
// "numberStudentClubs": 35,
// "numberExchangePartners": 200,
// ]

// funFactsRMIT["numberStudentClubs"] = 43
// funFactsRMIT["numberOfGraduates"] = 13500
// funFactsRMIT["worldUniversityRankingQS2022"] = 206
// funFactsRMIT["impactRankingGlobally"] = 3
// funFactsRMIT["yearFounded"] = 1887
// funFactsRMIT["numberOfStaffs"] = 9150

// print("Here are some fun facts of RMIT:")
// print("The Number Student Clubs: \(funFactsRMIT["numberOfStudents"])")
// print("The Year Found: \(funFactsRMIT["yearFounded"])")
// print("The Number Of Staffs: \(funFactsRMIT["numberOfStaffs"])")
// print("The World University Ranking QS 2022: \(funFactsRMIT["worldUniversityRankingQS2022"])")
// print("There are \(funFactsRMIT.count) facts in our fun facts dictionary about RMIT!")

// The Number Of Graduates: 13500
// The Number Student Clubs: 43
// The Year Founded: 1887
// The Number Of Staffs: 9150
// The World University Ranking QS 2022: 206
// There are 11 facts in our fun facts dictionary about RMIT!

// Q3
// func divideIfWhole(value: Int, divisor: Int) -> Int? {
//     if (value % divisor == 0) {
//         return value/divisor
//     }
//     return nil

// }

// print("Enter the value:")
// let value = readLine()
// print("Enter the divisor:")
// let divisor = readLine()
// if let valueString = value, let divisorString = divisor{
//     if let valueInt = Int(valueString), let divisorInt = Int(divisorString) {
//         if let numberOfDivisible = divideIfWhole(value: valueInt, divisor: divisorInt) {
//             print ("Yep, it divides \(numberOfDivisible) times")
//         } else {
//             print("Not divisible :((")
//         }
//     } else {
//         print("Please enter both the value and divisor as integers")
//     }
// } else {
//     print("Please enter both the value and divisor as integers")
// }

// Q4
// Define the User struct here
// struct User {
//     var name: String
//     var email: String?
//     var followers: Int
//     var isActive: Bool

//     init(name: String, email: String?, followers: Int, isActive: Bool){
//         self.name = name
//         self.email = email
//         self.followers = followers
//         self.isActive = isActive
//     }
//     func logStatus() {
//         if isActive {
//             print("\(name) is working hard")
//         } else {
//             print("\(name) has left Earth")
//         }
//     }
// }
// // Initialise a User struct here (for Jerry)
// var jerry = User(name: "Jerry",email: nil, followers: 0, isActive:false)
// jerry.logStatus()
// // Diagnostic code - do not change this code (to test your User struct)


// print("\nDiagnostic code to test your User struct:")
// var musk = User(name: "Elon", email: "elon@tesla.com", followers: 2001, isActive:true)
// musk.logStatus()
// print("Contacting \(musk.name) on \(musk.email!) ...")
// print("\(musk.name) has \(musk.followers) followers")
// // sometime later
// musk.isActive = false
// musk.logStatus()

// Q5
// class Point {
// // declare properties for x and y coordinates
//     var x: Double
//     var y: Double
//     // declare the initializer (constructor)
//     init(x: Double, y: Double) {
//         self.x = x
//         self.y = y
//     }
//     // declare the function distance
//     func distance(target: Point) -> Double {
//         return sqrt(pow(target.x - self.x, 2) + pow(target.y - self.y, 2))
//     }
// }

// // Write your code to read user inputs for two points coordinations
// func parseInput(input: String) -> Point? {
//     let coordinates = input.components(separatedBy:" ")
//     if coordinates.count == 2, let x = Double(coordinates[0]), let y = Double(coordinates[1]){
//         return Point(x: x, y: y)
//     }
//     print ("please enter 2 coordinates")
//     return nil
// }

// func getPointInput() -> Point{
//     while true {
//         print("Enter the x and y:")
//         if let coordinates = readLine() {
//             if let firstPoint = parseInput(input: coordinates){
//                 return firstPoint
//             }
//         }
//     }
// }

// let firstPoint = getPointInput()
// let secondPoint = getPointInput()
// print("The distance between X and Y is \(firstPoint.distance(target: secondPoint))")

// Q6
// let alphabet =
// ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
// let NUMBER_OF_LETTERS_IN_PWD = 6
// func genPassword() -> String {
//     var numberOfLetterLeft = 26 
//     var lettersArr: Array<String> = []
//     var alphabetSet = alphabet
//     for _ in 1...NUMBER_OF_LETTERS_IN_PWD {
//         let letterIndex = Int.random(in: 1...numberOfLetterLeft)
//         lettersArr.append(alphabetSet[letterIndex])
//         alphabetSet.remove(at: letterIndex)
//         numberOfLetterLeft -= 1
//     }
//     return lettersArr.joined(separator:"")
// }
// //The number of letters in alphabet equals 26
// let password = genPassword()
// print(password)

// Q7
// Do not modify this function
// func doMath(a: Int, b: Int, operation: (Int, Int) -> Int) {
//     print(operation(a, b))
// }

// // Call doMath function and provide an inline closure so that it will return the larger value between two numbers and print it out
// doMath(a: 1, b: 2) {(a, b) -> Int in
//     return a > b ? a : b
// }
// // Call doMath function again and this time provide an another inline closure so that it will multiple two numbers together and print it out
// doMath(a: 1, b:3) { (a,b) -> Int in
//     return a*b
// }

// Q8
let NUMBER_OF_NUMBER_IN_TICKET = 6

func makeList(_ n: Int) -> [Int] {
    return (0..<n).map{ _ in Int(arc4random_uniform(48) + 1) }
}

class Ticket{
    var ticketNumbers: Array<Int>
    init(ticketNumbers: Array<Int>){
        self.ticketNumbers = ticketNumbers
    }
    init(){
        self.ticketNumbers = makeList(NUMBER_OF_NUMBER_IN_TICKET)
    }
    func calculatePrize(winnerTicket: Ticket) -> Int{
        let sameNum = zip(self.ticketNumbers, winnerTicket.ticketNumbers).enumerated().filter() {$1.0 == $1.1}.map{$0.0}.count
        print(sameNum)
        switch sameNum {
            case 0: 
                return 0
            case 1,2:
                return 10
            case 3:
               return 100
            case 4: 
                return 1000
            case 5:
                return 5000
            case 6:
                return 5000000
            default:
                return 0
        }
    }
}

func parseInput(input: String) -> Ticket? {
    let coordinates = input.components(separatedBy:" ")
    if coordinates.count == NUMBER_OF_NUMBER_IN_TICKET {
        var ticketNumbers: Array<Int> = []
        for i in 0..<NUMBER_OF_NUMBER_IN_TICKET {
            if let number = Int(coordinates[i]) {
                if (number < 1 || number > 49){
                    return nil
                }
                print("good")
                ticketNumbers.append(number)
            }
            else {
                return nil
            }
        }
        return Ticket(ticketNumbers: ticketNumbers)
    }
    return nil
}

func manuallyGetTicket() -> Ticket {
    while true {
        if let input = readLine(){
            let playerTicket = parseInput(input: input)
            if playerTicket != nil {
                return playerTicket!
            }
            print("Please input again")
        } else {
            
        }
    }
}

func getTicket() -> Ticket {
    while true {
        if let choice = readLine(){
            if choice == "true" {
                return manuallyGetTicket()
            } else {
                return Ticket()
            }
        }
    }
}

while true {
    print ("Do you want to pick your own ticker number?")
    let playerTicket = getTicket()
    let winnerTicket = Ticket()
    print(playerTicket.ticketNumbers)
    print(winnerTicket.ticketNumbers)
    print(playerTicket.calculatePrize(winnerTicket: winnerTicket))
}
