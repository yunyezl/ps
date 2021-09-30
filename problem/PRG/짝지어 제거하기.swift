import Foundation
func solution(_ s:String) -> Int{
    if s.count == 0 {
        return 1
    }
    
    var arr = Array(s).map { String($0) }
    var stack: [String] = []
    for i in 0..<arr.count {
        if !stack.isEmpty && stack[stack.count - 1] == arr[i] {
            stack.popLast()
        } else {
            stack.append(arr[i])
        }
    }
    
    if stack.isEmpty {
        return 1
    } else {
        return 0
    }
}
