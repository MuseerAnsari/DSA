/*
 Given an array of integers nums and an integer target, return index of the two numbers such that they add up to target.
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 You can return the answer in any order.

 Example 1:
 Input: nums = [2,7,11,15], target = 9
 Output: [0,1]
 Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
 */

func twoSumSolution(_ nums: [Int], _ target: Int) -> [Int] {
    
    var map: [Int: Int] = [:]
    
    for i in 0..<nums.count {
        let num = nums[i]
        let compliment = target - num
       
        if let index = map[compliment] {
            return [index, i]
        }
        map[num] = i
    }
    return []
}

twoSumSolution([2,7,11,15], 9)

func twoSum(_ nums: [Int], target: Int) -> [Int] {
    
    var map: [Int:Int] = [:]
    
    for (index, num) in nums.enumerated() {
        map[num] = index
        let compliment = target - num
        // if map has compliment then curren index and compliment indec will be the solution
        if let mapIndex = map[compliment] {
            return [mapIndex, index]
        }
    }
    return []
}

twoSum([2, 7, 11, 15], target: 9)

func twoSumSolution2(_ nums: [Int], target: Int) -> [Int] {
    
    for (index1, num1) in nums.enumerated() {
        let compliment = target - num1
        for (index2, num2) in nums.enumerated() {
            if num2 == compliment {
                return [index1, index2]
            }
        }
    }
    return[]
}
twoSumSolution2([11, 15, 2, 7], target: 9)

func twoSumSolution3(_ nums: [Int], target: Int) -> [Int] {
    
    for i in 0..<nums.count {
        let compliment = target - nums[i]
        for j in 1..<nums.count {
            if nums[j] == compliment {
                return [i, j]
            }
        }
    }
    return[]
}
twoSumSolution3([2, 7, 11, 15], target: 9)
