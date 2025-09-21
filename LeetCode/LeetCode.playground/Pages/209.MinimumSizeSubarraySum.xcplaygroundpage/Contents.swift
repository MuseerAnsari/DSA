// https://leetcode.com/problems/minimum-size-subarray-sum/
/*
 Given an array of positive integers nums and a positive integer target, return the minimal length of a subarray whose sum is greater than or equal to target. If there is no such subarray, return 0 instead.

 Example 1:
 Input: target = 7, nums = [2,3,1,2,4,3]
 Output: 2
 Explanation: The subarray [4,3] has the minimal length under the problem constraint.
 */


func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
    
    var currentMinWindowLenght = Int.max
    var currentSum = 0
    var left = 0
    
    for right in 0..<nums.count {
        currentSum += nums[right]
        
        while currentSum >= target {
            currentMinWindowLenght = min(currentMinWindowLenght, right - left + 1)
            currentSum -= nums[left]
            left += 1
        }
    }
    return currentMinWindowLenght == .max ? 0 : currentMinWindowLenght
}

minSubArrayLen(7, [2,3,1,2,4,3])
