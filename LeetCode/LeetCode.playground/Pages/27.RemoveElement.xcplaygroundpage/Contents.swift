// https://leetcode.com/problems/remove-element/description/
/*
 Given an integer array nums and an integer val, remove all occurrences of val in nums in-place. The order of the elements may be changed. Then return the number of elements in nums which are not equal to val.

 Example 1:
 Input: nums = [3,2,2,3], val = 3
 Output: 2, nums = [2,2,_,_]
 Explanation: Your function should return k = 2, with the first two elements of nums being 2.
 It does not matter what you leave beyond the returned k (hence they are underscores).
 */

func removeElements(_ nums: inout [Int], val: Int) -> ([Int], Int) {
    let nonVal = nums.filter({$0 != val})
    let value = [Int](repeating: val, count: nums.count - nonVal.count)
    nums = nonVal + value
    return(nums, nonVal.count)
}
var nums = [0,1,2,2,3,0,4,2]
removeElements(&nums, val: 2)




