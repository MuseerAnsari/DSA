// https://leetcode.com/problems/contains-duplicate-ii/description/
/*
 Given an integer array nums and an integer k, return true if there are two distinct indices i and j in the array such that nums[i] == nums[j] and abs(i - j) <= k.
  
 Example 1:
 Input: nums = [1,2,3,1], k = 3
 Output: true
 Example 2:
 */


func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
    var map:[Int: Int] = [:]
    
    for i in 0..<nums.count {
        let num = nums[i]
        if let index = map[num] {
            if abs(index - i) <= k {
                return true
            }
        }
        map[num] = i
    }
    return false
}


// Input: nums = [1,2,3,1], k = 3
func containsNearbyDuplicate2(_ nums: [Int], _ k: Int) -> Bool {
    
    var window: Set<Int> = Set()
    var left = 0
    for right in 0..<nums.count {
        if right - left > k {
            left += 1
            window.remove(nums[left])
        }
        if window.contains(nums[right]) {
            return true
        }
        window.insert(nums[left])
    }
    return false
}

containsNearbyDuplicate2([1,2,3,1], 3)

