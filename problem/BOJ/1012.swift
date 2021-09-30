
import Foundation

let T = Int(readLine()!)!

@discardableResult
func dfs(_ x: Int, _ y: Int, _ m: Int, _ n: Int, _ field: inout [[Int]]) -> Bool {
    if x < 0 || x >= n || y < 0 || y >= m {
        return false
    }
    
    if field[x][y] == 1 {
        field[x][y] = 0 // 방문 처리
        dfs(x + 1, y, m, n, &field)
        dfs(x, y + 1, m, n, &field)
        dfs(x - 1, y, m, n, &field)
        dfs(x, y - 1, m, n, &field)
        return true
    }
    
    return false
}

for _ in 0..<T {
    let input = Array(readLine()!).split(separator: " ").map { Int(String($0))! }
    let m = input[0] // 배추밭의 가로 길이
    let n = input[1] // 배추밭의 세로 길이
    let k = input[2] // 배추의 개수
    
    var cabbageField = Array(repeating: Array(repeating: 0, count: m), count: n)
    
    for _ in 0..<k {
        let input = Array(readLine()!).split(separator: " ").map { Int(String($0))! }
        let a = input[0]
        let b = input[1]
        cabbageField[b][a] = 1
    }
    
    var answer = 0
    for i in 0..<n {
        for j in 0..<m {
            if dfs(i, j, m, n, &cabbageField) {
                answer += 1
            }
        }
    }
    
    print(answer)
}

