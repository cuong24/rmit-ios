let numbers = [45, 73, 195, 53]

//Write your code here (you can do it with or without a function)
func transformArray(inputArray: [Int]) -> [Int]{
    
    // create a new array to store new calculated numbers
    var newArray:[Int] = []
    
    // loop through till last two number,
    // each time we use current number and next one
    for i in 0..<inputArray.count-1 {
        newArray.append(inputArray[i]*inputArray[i+1])
    }
    
    // add the last number by multiplying first and last number 
    newArray.append(inputArray[inputArray.count-1]*inputArray[0])
    return newArray
}


let computedNumbers = transformArray(inputArray: numbers)
print(computedNumbers)
