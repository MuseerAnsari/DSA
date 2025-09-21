import Foundation
/*
 An OperationQueue is a high-level abstraction over GCD (Grand Central Dispatch)
 and provides more control and flexibility over task execution, including dependencies, priorities, Max concurrent operations and cancellation
 */
var increaseCounter = 1
let opration1 = BlockOperation {
    DispatchQueue.main.async {
        increaseCounter += 1
    }
    print("opration1")
}

let operation2 = BlockOperation {
    print("opration1")
}

let oprationQueue = OperationQueue()
opration1.addDependency(operation2)
opration1.queuePriority = .high
opration1.cancel()
oprationQueue.addOperation(opration1)
oprationQueue.addOperation(operation2)
oprationQueue.maxConcurrentOperationCount = 1


