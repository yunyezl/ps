class Solution {
    func minReorder(_ n: Int, _ connections: [[Int]]) -> Int {
        var graph = [Int: [Int]]()
        var visited = Set<Int>()
        var changes = 0 
        
        for connection in connections {
            let u = connection[0]
            let v = connection[1]
            graph[u, default: []].append(v)
            graph[v, default: []].append(-u)
        }
        
        func dfs(_ node: Int) {
            visited.insert(node)
            for neighbor in graph[node, default: []] {
                if !visited.contains(abs(neighbor)) {
                    changes += neighbor > 0 ? 1 : 0
                    dfs(abs(neighbor))
                }
            }
        }
        
        dfs(0)
        return changes
    }
}
