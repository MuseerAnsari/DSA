import UIKit
/*
 A higher-order function in Swift is a function that either takes one or more functions as parameters or returns a function as its result.
 */

func applyOpration(_ a: Int, _ b: Int, _ opration: (Int, Int) -> Int) -> Int {
    return add(a, b)
}

func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

applyOpration(4, 5, add)


func custmSort<T>(_ array: [T], by areIncreasingOrder: (T, T) -> Bool) -> [T] {
    return array.sorted(by: areIncreasingOrder)
}

custmSort(["1","2","3","4","4","31"]) { a, b in
    return a.count > b.count
}

func custumSort<T: Comparable>(_ array: [T]) -> [T] {
    return descendingOrder(array)
}

func descendingOrder<T: Comparable>(_ a: [T]) -> [T] {
    return a.sorted(by: {$0 > $1})
}

custumSort([1,2,123,12,312,3123,321,3])


