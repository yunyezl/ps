import Foundation

func solution(_ str:String) -> Int {
    let dic : [String: Int] = ["zero": 0, "one": 1, "two": 2, "three": 3, "four": 4, "five": 5, "six": 6, "seven": 7, "eight": 8, "nine": 9]
    
    var result = ""
    
    var temp = ""
    for s in str {
        if let number = Int(String(s)) {
            result += String(number)
        } else {
            temp += String(s)
        }
        
        if let dicValue = dic[temp] {
            result += String(dicValue)
            temp = ""
        }
    }
    
    return Int(result)!
}
