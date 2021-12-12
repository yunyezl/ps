import Foundation

func solution() {
    
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n, m) = (input[0], input[1])
    var board: [[Int]] = []

    for _ in 0..<n {
        board.append(Array(readLine()!.map { Int(String($0))! }))
    }
    
    let dy = [1, 0, -1, 0]
    let dx = [0, 1, 0, -1]
    
    func bfs(_ y: Int, _ x: Int) -> Int {
        var queue = [(y, x)]
        var left = 0
        board[y][x] = 0
        while left < queue.count {
            let (y, x) = queue[left]
            for i in 0..<4 {
                let py = dy[i] + y
                let px = dx[i] + x
                if py >= n || py < 0 || px >= m || px < 0 || board[py][px] != 1 {
                    continue
                }
                board[py][px] = board[y][x] + 1
                queue.append((py, px))
            }
            left += 1
        }
        return board[n-1][m-1] + 1
    }

    print(bfs(0, 0))

}

solution()
