//Tut 1
//let myNumber = 4
//func checkDivisible(aNumber: Int) -> String{
//    let maxDivisibleNum = Int(Double(aNumber).squareRoot())
//    for num in 2...maxDivisibleNum{
//        if aNumber % num == 0 {
//            print(num)
//            return String(aNumber) + " is divisible"
//        }
//    }
//    return String(aNumber) + " is not divisible"
//}
//let result = checkDivisible(aNumber: myNumber)
//print(result)

//Tut2
//let myNumber = 30
//func checkDivisible(aNumber: Int) -> String{
//    if aNumber % 30 == 0 {
//        return String(aNumber) + " is divisible by both 5 and 6"
//    }
//    if aNumber % 5 == 0 {
//        return String(aNumber) + " is divisible by 5"
//    }
//    if aNumber % 6 == 0 {
//        return String(aNumber) + " is divisible by 6"
//    }
//    return String(aNumber) + " is not divisible"
//}
//let result = checkDivisible(aNumber: myNumber)
//print(result)

//Exe 3
//let numArr = [3, 1, 4, 2]
//func computeNumbers(numArr: Array<Int>) -> Array<Int> {
//    var computedArr: Array<Int> = []
//    for (index, num) in numArr.enumerated(){
//        if (index == numArr.count - 1){
//            computedArr.append(num * numArr[0])
//        } else {
//            computedArr.append(num * numArr[index + 1])
//        }
//    }
//    return computedArr
//}
//let computedNumbers = computeNumbers(numArr:numArr)
//print(computedNumbers)

//Exe 4
//let width = 8
//let height = 3
//print("Current width: \(width)");
//print("Current height: \(height)");
//func drawRectangle(givenWidth: Int, givenHeight: Int) {
//    for _ in 1...givenHeight {
//        for _ in 1...givenWidth {
//            print("*", terminator:" ")
//        }
//        print("")
//    }
//}
//drawRectangle(givenWidth: width, givenHeight: height)

//Exe 5
//import Foundation // required for String(format: _, _)
//let a = 5
//let b = 6
//// Write your code here to define 4 functions as requested
//func add(n1: Int, n2: Int) -> String {
//    return String(n1 + n2)
//}
//
//func subtract(n1: Int, n2: Int) -> String {
//    return String(n1-n2)
//}
//
//func multiply(n1: Int, n2: Int) -> String {
//    return String(n1*n2)
//}
//
//func divide(n1: Int, n2: Int) -> String {
//    return String(format: "%.2f", Double(n1)/Double(n2))
//}
////To make the function calls below work, please write 4 functions above
//print(add(n1: a, n2: b))
//print(subtract(n1: a, n2: b))
//print(multiply(n1: a, n2: b))
//print(divide(n1: a, n2: b))


//Exe 6
//let sizes = [3, 6, 100]
//func isValidTriangleSizeInput(sizes: Array<Int>) -> Bool{
//    if sizes.count != 3 {
//        return false
//    }
//    return true
//}
//func isTriangle(sizes: Array<Int>) -> Bool{
//    let sumOfAllSizes = sizes.reduce(0, +)
//    for size in sizes {
//        if (size * 2 > sumOfAllSizes) {
//            return false
//        }
//    }
//    return true
//}
//func isEquilateral(sizes: Array<Int>) -> Bool{
//    return sizes[0] == sizes[1] && sizes[1] == sizes[2]
//}
//func isIsosceles(sizes: Array<Int>) -> Bool{
//    return sizes[0] == sizes[1] || sizes[1] == sizes[2] || sizes[0] == sizes[2]
//}
//
//func classifyTriangle(sizes: Array<Int>) -> String {
//    if (!isValidTriangleSizeInput(sizes: sizes)){
//        return("Invalid array input")
//    }
//    if (!isTriangle(sizes: sizes)){
//        return("It is not a Triangle")
//    }
//    if (isEquilateral(sizes: sizes)){
//        return("It is an Equilateral Triangle")
//    }
//    if (isIsosceles(sizes: sizes)){
//        return("It is an Isosceles Triangle")
//    }
//    return("It is a Scalene Triangle")
//}
//classifyTriangle(sizes: [3, 6, 100])
//classifyTriangle(sizes: [6, 6, 9])
//classifyTriangle(sizes: [25, 25, 25])
//classifyTriangle(sizes: [3, 4, 5])


