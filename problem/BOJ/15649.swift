import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

var array: [String] = Array(repeating: "0", count: m)
var visited: [Bool] = Array(repeating: false, count: n + 1)

func backtracking(cnt: Int) {
    if cnt == m {
        for _ in 0..<m {
            print(array.joined(separator: " "))
            return
        }
    }
    
    for i in 1...n {
        if !visited[i] {
            visited[i] = true
            array[cnt] = String(i)
            backtracking(cnt: cnt + 1)
            visited[i] = false
        } else {
        }
    }
}

backtracking(cnt: 0)
