import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    
    var visited = Array(repeating: false, count: n)
    var count = 0
    
    func dfs(_ v: Int) {
        visited[v] = true
        for i in 0..<n {
            if !visited[i] && computers[v][i] == 1 {
                dfs(i)
            }
        }
    }
    
    for i in 0..<n {
        if !visited[i] {
            count += 1
            dfs(i)
        }
    }
    
    return count
}
