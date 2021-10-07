let T = Int(readLine()!)!

var dx = [-1, -1, 1, 1, -2, -2, 2, 2]
var dy = [-2, 2, -2, 2, -1, 1, -1, 1]

for _ in 0..<T {

    let n = Int(readLine()!)!
    var input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (nx, ny) = (input[0], input[1]) // 나이트의 초기 위치
    input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (tx, ty) = (input[0], input[1]) // 타겟 좌표
    var visited = Array(repeating: Array(repeating: false, count: n + 1), count: n + 1)

    var queue = [(0, nx, ny)]
    visited[nx][ny] = true
    var left = 0
    while left < queue.count {
        let (sec, px, py) = queue[left]
        if px == tx && py == ty {
            print(sec)
            break
        }
        for i in 0..<8 {
            let mx = px + dx[i]
            let my = py + dy[i]
            if mx < 0 || mx >= n || my < 0 || my >= n {
                continue
            }
            if !visited[mx][my] {
                queue.append((sec + 1, mx, my))
                visited[mx][my] = true
            }
        }
        left += 1
    }

}
