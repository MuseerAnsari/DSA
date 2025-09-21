import Foundation

/*
 Modern concurrency in Swift is built on async/await and structured concurrency.
 */


func fetchUser() async throws -> String {
    print("Fetching User")
    try await Task.sleep(nanoseconds: 2_000_000_000)
    return "User List"
}

func fetchPhotos() async throws -> String {
    print("fetching Photos")
    try await Task.sleep(nanoseconds: 2_000_000_000)
    return "Photo list"
}

// Task Represents a unit of asynchronous work.
Task {
    do {
        let user = try await fetchUser()
        print("Fetched single task \(user)")
    } catch {
        print(error.localizedDescription)
    }
}

// Run multiple async tasks in parallel and wait for them.
Task {
    do {
        async let getUser = fetchUser()
        async let getPhotos = fetchPhotos()
        let (users, photos) = try await (getUser, getPhotos)
        print("\(users)\n\(photos)")
    } catch {
        print(error.localizedDescription)
    }
}

// Task Groups
// Run a dynamic number of tasks concurrently.

func fetchAll() async throws {
    await withTaskGroup(of: String.self) { group in
        for i in 0...5 {
            group.addTask {
                return "Task \(i) result"
            }
        }
        for await result in group {
            print(result)
        }
    }
}

Task {
    try await fetchAll()
}

