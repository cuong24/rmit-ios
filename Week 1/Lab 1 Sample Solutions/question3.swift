let width = 8
let height = 3

print("Current width: \(width)");
print("Current height: \(height)");

func drawRectangle(givenWidth: Int, givenHeight: Int) {
    // Complete the function body
    for _ in 1...givenHeight{
        for _ in 1...givenWidth{
            print("*",terminator: "")
        }
        print()
    }
}
drawRectangle(givenWidth: width, givenHeight: height)
