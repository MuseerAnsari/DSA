import Foundation
// https://leetcode.com/problems/reverse-words-in-a-string/description/
/*
 Given an input string s, reverse the order of the words.
 A word is defined as a sequence of non-space characters. The words in s will be separated by at least one space.
 Return a string of the words in reverse order concatenated by a single space.
 Note that s may contain leading or trailing spaces or multiple spaces between two words. The returned string should only have a single space separating the words. Do not include any extra spaces.
  
 Example 1:
 Input: s = "the sky is blue"
 Output: "blue is sky the"
 */

func reverseWords(_ s: String) -> String {
    let string = s.split(separator: " ")
        .reversed()
        .joined(separator: " ")
    return string
}
// reverseWords(" the sky is blue ")

func reverseWords2(_ s: String) -> String {
    
    var array: [String] = []
    var word = ""
    
    for char in s {
        guard char.isLetter || char.isNumber || char.isWhitespace else { continue }
        if char != " " {
            word += String(char)
        } else {
            if word != "" {
                array.append(word)
            }
            word = ""
        }
    }
    
    var reverseArray: [String] = []
    var i = 0
    let count = array.count
    while i < count {
        reverseArray.append(array[count - i - 1])
        i += 1
    }
    
    var joinedStr = ""
    for word in reverseArray {
        joinedStr += " \(word)"
    }
    
    return joinedStr.trimmingCharacters(in: .whitespaces)
}
reverseWords2(" the sky is   blue ")
