import UIKit
import Combine

// ******** Just Publisher ************
/*
 Emits a single value immediately and then finishes.
 */
//Just("Hello")
//    .sink { value in
//        print(value)
//    }

// *************** Future publisher ************
/*
 Produces a single value asynchronously (or an error).
 */
var cancellable = Set<AnyCancellable>()
//
//Future<Int, Error> { promise in
//    DispatchQueue.main.async {
//        promise(.success(2))
//    }
//}
//.map({$0 * 2})
//.sink { value in
//    print("value === \(value)")
//} receiveValue: { print($0)
//}
//.store(in: &cancellable)
//
////future.self
//
//
//Empty<Int, URLError>()
//    .sink(receiveCompletion: { print("Done:", $0) },
//          receiveValue: { print($0) })

//Fail<String, URLError>(error: URLError(.badURL))
//    .sink { error in
//        print(error)
//    } receiveValue: { value in
//        print("value == \(value)")
//    }

//Fail<String, URLError>(outputType: String.self, failure: URLError(.badURL))
//    .sink { eror in
//        print("error === \(eror)")
//    } receiveValue: { value in
//        print("my name is museer")
//    }

//let subject = CurrentValueSubject<String, Never>("sahil")
//subject.sink { value in
//    print(value)
//}.store(in: &cancellable)
//
//subject.send("Hello")
//subject.send("Museer ansari")
//subject.sink { value in
//    print(value)
//}.store(in: &cancellable)
//
//subject.sink { value in
//    print(value)
//}.store(in: &cancellable)

let currentValueSubject = CurrentValueSubject<Int, Never>(0)
currentValueSubject.sink { value in
    print("CurrentValueSubject received: \(value)")
}
//currentValueSubject.send(1)
//currentValueSubject.value = 2
// Output:
// CurrentValueSubject received: 0
// CurrentValueSubject received: 1
// CurrentValueSubject received: 2
