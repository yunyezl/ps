import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (F, S, G, U, D) = (input[0], input[1], input[2], input[3], input[4])

let moves = [U, -D]
var visited = Array(repeating: false, count: F + 1)

func bfs() -> Bool {
    var queue = [(0, S)]
    visited[S] = true
    var left = 0
    
    while left < queue.count {
        let (cnt, now) = queue[left]
        if now == G {
            print(cnt)
            return true
        }
        for move in moves {
            let next = now + move
            if next <= 0 || next > F {
                continue
            }
            if !visited[next] {
                queue.append((cnt + 1, next))
                visited[next] = true
            }
        }
        left += 1
    }
    
    return false
}

if !bfs() {
    print("use the stairs")
}
