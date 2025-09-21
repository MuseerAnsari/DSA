// https://leetcode.com/problems/longest-valid-parentheses/description/
/*
 Given a string containing just the characters '(' and ')', return the length of the longest valid (well-formed) parentheses substring.

 Example 1:
 Input: s = "(()"
 Output: 2
 Explanation: The longest valid parentheses substring is "()".
 */

func longestValidParentheses(_ s: String) -> Int {
    
    var stack: [Int] = [-1]
    var maxLength = 0
    
    for (index, char) in s.enumerated() {
        
        if char == "(" {
            stack.append(index)
        } else {
            // Remove last index from stack to keep track diffrences in * 2
            stack.removeLast()
            // if stack in not empty
            if let last = stack.last {
                maxLength = max(maxLength, index - last)
            } else {
                stack.append(index)
            }
        }
    }
    return maxLength
}

longestValidParentheses("(())))((((()))))")

