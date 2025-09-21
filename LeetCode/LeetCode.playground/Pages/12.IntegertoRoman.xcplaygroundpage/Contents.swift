// https://leetcode.com/problems/integer-to-roman/description/


func intToRoman(_ num: Int) -> String {
    var romanValues = [
        (1000, "M"),
        (900, "CM"),
        (500, "D"),
        (400, "CD"),
        (100, "C"),
        (90, "XC"),
        (50, "L"),
        (40, "XL"),
        (10, "X"),
        (9, "IX"),
        (5, "V"),
        (4, "IV"),
        (1, "I")
    ]
    
    var result = ""
    var number = num
    for (val, str) in romanValues {
        var count = number / val
        if count > 0 {
            result += String(repeating: str, count: count) // Not clear
        }
        number -= val * count
    }
    return result
}

intToRoman(3749)
