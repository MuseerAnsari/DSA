// Associated types act as placeholders for a type that isn’t specified until a protocol is adopted

struct Technical {
    let title: String
}

struct Teacher {
    let title: String
}

protocol Job {
    associatedtype Position //Placeholder
    var jobs: [Position]? { get }
    func addJob(_ job: Position)
}

class Walmart: Job {
    var jobs: [Technical]?
    func addJob(_ job: Technical) {
        jobs?.append(job)
    }
}

class Schools: Job {
    var jobs: [Teacher]?
    func addJob(_ job: Teacher) {
        jobs?.append(job)
    }
}

