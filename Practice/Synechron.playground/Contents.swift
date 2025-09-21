import UIKit

var greeting = "Hello, playground"


func add<T: Numeric>(_ a: T, _ b: T) -> T  {
    
    let sum = a + b
    
    defer {
        print("1")
    }
    
    defer {
        print("2")
    }
    
    defer {
        print("3")
    }
    
    return sum
}

add(5, 4)
