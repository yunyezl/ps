import Foundation

let input = Array(readLine()!).split(separator: " ").map { Int(String($0))! }
let n = input[0]
let m = input[1]
var v = input[2]

var graph = Array(repeating: Array<Int>(),count: n + 1)
var visited = Array(repeating: false, count: n + 1)

for _ in 1..<m+1 {
    let input = Array(readLine()!).split(separator: " ").map { Int(String($0))! }
    let a = input[0]
    let b = input[1]
    graph[a].append(b)
    graph[b].append(a)
    graph[a].sort()
    graph[b].sort()
}

var dfsResult = String()
func dfs(_ graph: [[Int]], _ v: Int){
    visited[v] = true
    dfsResult += String(describing: v) + " "
    for i in graph[v]{
        if !visited[i] {
            dfs(graph, i)
        }
    }
}

var bfsResult = String()
func bfs(_ graph: [[Int]], _ start: Int) {
    var queue: [Int] = [start]
    visited[v] = true
    while !queue.isEmpty {
        let v = queue.removeFirst()
        bfsResult += String(describing: v) + " "
        for i in graph[v] where !visited[i] {
            queue.append(i)
            visited[i] = true
        }
    }
}

dfs(graph, v)
print(dfsResult)

visited = Array(repeating: false, count: n + 1)

bfs(graph, v)
print(bfsResult)
