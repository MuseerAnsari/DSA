// https://leetcode.com/problems/ugly-number-ii/description/
/*
 An ugly number is a positive integer whose prime factors are limited to 2, 3, and 5.
 Given an integer n, return the nth ugly number.

 Example 1:
 Input: n = 10
 Output: 12
 Explanation: [1, 2, 3, 4, 5, 6, 8, 9, 10, 12] is the sequence of the first 10 ugly numbers.
 */


func nthUglyNumber(_ n: Int) -> Int {
    var set = Set([1])
    for _ in 1..<n {
        let currentMin = set.min()!
        set.remove(currentMin)
        set.insert(currentMin * 2)
        set.insert(currentMin * 3)
        set.insert(currentMin * 5)
        print(set)
    }
    return set.min()!
}
nthUglyNumber(10)

func nthUglyNumber2(_ n: Int) -> Int {
    
    var ugly:[Int] = [Int](repeatElement(0, count: n))
    ugly[0] = 1
    
    var i2 = 0, i3 = 0, i5 = 0
    for i in 1..<n {
        let next_i2 = ugly[i2] * 2
        let next_i3 = ugly[i3] * 3
        let next_i5 = ugly[i5] * 5
        
        let next = min(next_i2, next_i3, next_i5)
        ugly[i] = next
        
        if next == next_i2 { i2 += 1 }
        if next == next_i3 { i3 += 1 }
        if next == next_i5 { i5 += 1 }
    }
    
    return ugly.last!
}

nthUglyNumber2(10)




func nthUglyNumber3(_ n: Int) -> Int {
    
    var seuences = 0
    var result: [Int] = []
    var tempNumber = 1
    while seuences < n {
        var number = tempNumber
        while number % 5 == 0 { number /= 5 }
        while number % 3 == 0 { number /= 3 }
        while number % 2 == 0 { number /= 2 }
        if number == 1 {
            result.append(tempNumber)
            seuences += 1
        }
        tempNumber += 1
    }
    return result.last ?? 0
}
nthUglyNumber3(10)
