// https://leetcode.com/problems/missing-number/description/
/*
 Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.

 Example 1:
 Input: nums = [3,0,1]
 Output: 2
 Explanation:
 n = 3 since there are 3 numbers, so all numbers are in the range [0,3]. 2 is the missing number in the range since it does not appear in nums.
 */

func missingNumber(_ nums: [Int]) -> Int {
    let set = Set(nums)
    let rangSet = Set(0...nums.count)
    return rangSet.subtracting(set).first ?? 0
}
missingNumber([1,2])


func missingNumber2(_ nums: [Int]) -> Int {
    guard nums.count > 0 else { return 0 }
    let sorted = nums.sorted()
    var previous = sorted.first ?? 0
    for i in 1..<sorted.count {
        if previous + 1 != sorted[i] {
            return  sorted[i] - 1
        }
        previous = sorted[i]
    }
    let start = sorted.first ?? 0
    let last = sorted.last ?? 0
    return start > 0 ? start - 1 : last + 1
}
missingNumber2([1,2])
