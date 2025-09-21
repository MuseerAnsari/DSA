// Given a string s, find the length of the longest substring without duplicate characters.

/*
 Example 1:
 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 */

func lengthOfLongestSubstring(_ s: String) -> Int {
    var chars: [Character] = []
    var subRange = 0
    for char in s {
        if let index = chars.firstIndex(where: {$0 == char}) {
            chars.removeSubrange(0...index)
        }
        chars.append(char)
        subRange = max(chars.count, subRange)
    }
    return subRange
}

lengthOfLongestSubstring("abcabcbb")

func longestSubstringSoloution2(_ s: String) -> String {
  
    var subString = ""
    var result = ""
    for char in s {
        if subString.contains(where: {$0 == char}) {
            if subString.count > result.count {
                result = subString
            }
            subString = ""
        }
        if subString.count > 0 {}
        subString.append(String(char))
    }
    return result
}

longestSubstringSoloution2("pwwkew")
