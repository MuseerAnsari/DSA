import Foundation

// ******************* Semaphore ******************************
/*
 It allows only a limited number of threads to access a resource at the same time.
 */

let semaphore = DispatchSemaphore(value: 2) // // allow 2 threads at a time
let queue = DispatchQueue.global()
var trackerNumber = 1

func perfromTasksUsingSemaphore() {
    for i in 0...10 {
        queue.async {
            semaphore.wait()
            print("Task: start = \(i)")
            DispatchQueue.main.async {
                trackerNumber += 1
            }
            sleep(2)
            print("Task: Finished \(i)")
            semaphore.signal()
        }
    }
}
perfromTasksUsingSemaphore()

// ****************** NSLock *********************
/*
 A Lock is a synchronization mechanism that ensures only one thread can access a shared resource at a time.
 */
let lock = NSLock()
func perfromTasksUsingLock() {
    for i in 0...10 {
        queue.async {
            lock.lock()
            print("Task: start = \(i)")
            DispatchQueue.main.async {
                trackerNumber += 1
            }
            sleep(2)
            print("Task: Finished \(i)")
            lock.unlock()
        }
    }
}
// perfromTasksUsingLock()

// ****************** Dispatch Group ******************
/*
 A DispatchGroup is used when you have multiple tasks that can run in parallel, and you want to know when all of them are finished.
 */

let dispatchGroup = DispatchGroup()
func perfromTasksDispatchGroup() {
    for i in 0...10 {
        queue.async {
            dispatchGroup.enter()
            print("Task: start = \(i)")
            DispatchQueue.main.async {
                trackerNumber += 1
            }
            sleep(2)
            print("Task: Finished \(i)")
            dispatchGroup.leave()
        }
    }
}
//print("Waiting")
// perfromTasksDispatchGroup()
//dispatchGroup.wait() // blocks until all tasks finish
//print("Wait over")
//dispatchGroup.notify(queue: .main) {
//    print("All task completed")
//}

// ************** DispatchWorkitem ***************
/*
 manages a single task that can (cancel, notify, reuse).
 */

let workItem = DispatchWorkItem {
    if !workItem.isCancelled {
        print("Do job")
    }
}
workItem.cancel()
// notify
workItem.notify(queue: .main) {
    print("Job done")
}
// reuse
workItem.perform()
DispatchQueue.main.async(execute: workItem)

// cancel
workItem.cancel()

//************************** Barrier *************************
/*
 A barrier is a special task submitted to a concurrent dispatch queue:
     •    Waits for all tasks already in the queue to finish.
     •    Executes exclusively (no other tasks run during it).
     •    After it finishes, the queue continues running tasks concurrently.
 */

let concorrentQueue = DispatchQueue(label: "com.example.queue", attributes: .concurrent)
var items = [Int]()
// Readers
for i in 1...3 {
    concorrentQueue.async {
        DispatchQueue.main.async {
            print("Reader \(i) sees items: \(items)")
        }
    }
}

// Exclusive writer
concorrentQueue.async(flags: .barrier) {
    DispatchQueue.main.async {
        items.append(42)
    }
    print("Writer added 42")
}

