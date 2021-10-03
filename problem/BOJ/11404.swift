import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var graph = Array(repeating: Array(repeating: Int(1e9), count: n), count: n)

for a in 0..<n {
    for b in 0..<n {
        if a == b {
            graph[a][b] = 0
        }
    }
}

for _ in 0..<m {
    let input = Array(readLine()!).split(separator: " ").map { Int(String($0))! }
    let a = input[0]
    let b = input[1]
    let c = input[2]
    if c < graph[a-1][b-1] {
        graph[a-1][b-1] = c
    }
}

for k in 0..<n {
    for a in 0..<n {
        for b in 0..<n {
            graph[a][b] = min(graph[a][b], graph[a][k] + graph[k][b])
        }
    }
}

for a in 0..<n {
    var str = ""
    for b in 0..<n {
        if graph[a][b] == Int(1e9) {
            str += "0 "
        } else {
            str += "\(graph[a][b]) "
        }
        if b == n - 1 {
            print(str)
        }
    }
}



