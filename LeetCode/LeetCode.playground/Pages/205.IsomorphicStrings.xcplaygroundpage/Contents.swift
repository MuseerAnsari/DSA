// https://leetcode.com/problems/isomorphic-strings/description/
/*
 Given two strings s and t, determine if they are isomorphic.
 Two strings s and t are isomorphic if the characters in s can be replaced to get t.
 All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character, but a character may map to itself.

 Example 1:
 Input: s = "egg", t = "add"
 Output: true

 Explanation:
 The strings s and t can be made identical by:
 Mapping 'e' to 'a'.
 Mapping 'g' to 'd'.
 */


func isIsomorphic(_ s: String, _ t: String) -> Bool {
    
    guard s.count == t.count else { return false }
    var map: [Character : Character] = [:]
    
    let originalArray = Array(s)
    let replacingArray = Array(t)
    
    for i in 0..<s.count {
        
        let originalChar = originalArray[i]
        let replacingChar = replacingArray[i]

        // if original later is present in map as key
        if !map.contains(where: {$0.key == originalChar}) {
            // if later is present with some other key
            guard !map.contains(where: {$0.value == replacingChar})
            else { return false }
            map[originalChar] = replacingChar
        } else {
            guard map[originalChar] == replacingChar
            else { return false }
        }
    }
    return true
}

isIsomorphic("agg", "add")
