class Solution {
    func find_parent(_ x: Int, _ parent: inout [Int]) -> Int {
        if parent[x] != x {
            parent[x] = find_parent(parent[x], &parent)
        }
        
        return parent[x]
    }
    
    func union(_ a: Int, _ b: Int, parent: inout [Int])  {
        let a = find_parent(a, &parent)
        let b = find_parent(b, &parent)
        if a < b {
            parent[b] = a
        } else {
            parent[a] = b
        }
    }
    
    func makeConnected(_ n: Int, _ connections: [[Int]]) -> Int {
        if connections.count < n-1 {
            return -1
        }
        
        var parent = Array(repeating: 0, count: n)
        
        for i in 0..<n {
            parent[i] = i
        }
        
        for connection in connections {
            union(connection[0], connection[1], parent: &parent)
        }
        
        
        var roots = Set<Int>()
        for i in 0..<n {
            var root = find_parent(i, &parent)
            roots.insert(root)
        }
        
        return roots.count - 1
    }
}