import Foundation

func checkRightString(_ arr: [Character]) -> Bool {
    var stack: [Character] = []
    for a in arr {
        if stack.isEmpty {
            stack.append(a)
        } else if a == "}" && stack.last! == "{" {
            stack.removeLast()
        } else if a == "]" && stack.last! == "[" {
            stack.removeLast()
        } else if a == ")" && stack.last! == "(" {
            stack.removeLast()
        } else {
            stack.append(a)
        }
    }
    return stack.isEmpty
}

func solution(_ s:String) -> Int {
    
    var cnt = 0
    for i in 0..<s.count {
        var arr = Array(s)
        arr = Array(arr[i..<arr.count] + arr[0..<i])
        if checkRightString(arr) { cnt += 1 }
    }
    
    return cnt
}
