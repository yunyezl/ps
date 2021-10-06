func bfs() {
    var queue = [(0, n)]
    var left = 0
    var visited = Array(repeating: false, count: 100001)
    
    while left < queue.count {
        let (sec, cur) = queue[left]
        if cur == k {
            print(sec)
            return
        }
        for next in [cur - 1, cur + 1 , cur * 2] {
            if next >= 0 && next <= 100000 && !visited[next] {
                queue.append((sec + 1, next))
                visited[next] = true
            }
        }
        left += 1
    }
}


let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, k) = (input[0], input[1])
var allSecond: [Int] = []

bfs()
