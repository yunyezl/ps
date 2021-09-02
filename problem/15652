import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]
let m = input[1]

var array: [Int] = Array(repeating: 0, count: m)

func backtracking(_ cnt: Int, _ num: Int, _ string: String) {
    if cnt == m {
        print(string)
        return
    }
    
    if num <= n {
        for i in num...n {
            backtracking(cnt + 1, i, string + "\(i) ")
        }
    }
}

backtracking(0, 1, "")
