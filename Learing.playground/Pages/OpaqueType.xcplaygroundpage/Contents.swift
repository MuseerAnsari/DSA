// Opaque types in Swift provide a way to return values that conform to a protocol without exposing the exact type

protocol Vender {
    func layoffs() -> Int
}

struct Caspex: Vender {
    var count: Int
    func layoffs() -> Int {
        return count
    }
}

struct Mindtree: Vender {
    var count: Int
    func layoffs() -> Int {
        return count
    }
}

func doRandomLayoffs() -> Vender {
    if Bool.random() {
        return Caspex(count: 25)
    } else {
        return Mindtree(count: 45)
    }
}

let solution = doRandomLayoffs()
solution.layoffs()
