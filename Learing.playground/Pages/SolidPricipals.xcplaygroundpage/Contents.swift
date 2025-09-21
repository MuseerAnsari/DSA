//************* SRP: Single resposibility principal ***********

// UserManager only resposible for fetch and save user
class UserManager {
    func fetchUser() {
        // will fetch user data
    }
    func saveUser() {
        // Will save user data
    }
}

//************* OCP: Open and close principal ***************

/*
enum Payment {
    case creditCard, applyPay
}
class PaymentProcessor {
    // This function is not closed if any payment method comes in the future
    func process(method: Payment) {
        switch method {
        case .creditCard:
            print("Credit Card")
        case .applyPay:
            print("Apply Pay")
        }
    }
}
*/

protocol DevicePort {
    func runJob()
}

struct DataTransfer: DevicePort {
    func runJob() {
        print("Data Transfer")
    }
}

// New method → Just add new type, no changes to old code.
struct Charging: DevicePort {
    func runJob() {
        print("Charging")
    }
}

class PortProcessor {
    private let port: DevicePort
    
    init(port: DevicePort) {
        self.port = port
    }
    
    func process() {
        port.runJob()
    }
}
// usage
let processor  = PortProcessor(port: Charging())
processor.process()

//************* LSP: Liskov Substitution Principle *******

// Objects of a superclass should be replaceable with objects of its subclasses without affecting the correctness of the program.
// Child must honor the behavioral contract of their parent type

protocol Bird { }

protocol Flyable {
    func fly()
}

class Sparrow: Bird, Flyable {
    func fly() { print("Sparrow flying") }
}

class Penguin: Bird {
    // Penguins don’t conform to Flyable
}

func letBirdFly(_ bird: Flyable) {
    bird.fly()
}

let sparrow = Sparrow()
let penguin = Penguin()

letBirdFly(sparrow)   // ✅ Works
// letBirdFly(penguin) ❌ Compile-time error, not runtime crash
