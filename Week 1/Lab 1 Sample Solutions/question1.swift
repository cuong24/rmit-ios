let myNumber = -5

func checkDivisible(aNumber: Int) -> String{
    // Please complete the function body
    if aNumber > 0 {
        if (aNumber % 5 == 0) && (aNumber % 6 == 0){
            return "\(aNumber) is divisible by both 5 and 6."
        } else if (aNumber % 5 == 0) || (aNumber % 6 == 0){
            return "\(aNumber) is divisible by 5 or 6, but not both."
        }else {
            return "\(aNumber) is neither divisible."
        }
    } else {
        return "\(aNumber) is not a valid number."
    }
    
}

let result = checkDivisible(aNumber: myNumber)
print(result)
