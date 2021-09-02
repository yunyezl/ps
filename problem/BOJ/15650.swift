import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

var array: [String] = Array(repeating: "0", count: m)
var visited: [Bool] = Array(repeating: false, count: n + 1)

func backtracking(_ num: Int, _ cnt: Int) {
    if cnt == m {
        for _ in 0..<m {
            print(array.joined(separator: " "))
            return
        }
    }
    
    if num <= n {
        for i in num...n {
            if !visited[i] {
                visited[i] = true
                array[cnt] = String(i)
                backtracking(i + 1, cnt + 1)
                visited[i] = false
            }
        }
    }
}
