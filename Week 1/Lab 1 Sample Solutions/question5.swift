let sizes = [3, 6, 100]

// Complete your code below (print out sizes and classify the triangle)
print("The three sizes of the triangle are: \(sizes[0]),\(sizes[1]),\(sizes[2]).")
let a = sizes[0]
let b = sizes[1]
let c = sizes[2]

if (a+b>c) && (a+c>b) && (b+c>a){
    if (a==b) && (b==c) && (c==a){
        print("It is an Equilateral Triangle")
    }else if (a==b) || (b==c) || (c==a){
        print("It is an Isosceles Triangle")
    }else {
        print("It is a Scalene Triangle")
    }
}else{
    print("It is not a Triangle")
}
