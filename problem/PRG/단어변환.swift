import Foundation

func isChangeable(a: String, b: String) -> Bool {
    if a.difference(from: b).count == 2 {
        return true
    }
    return false
}

func bfs(begin: String, target: String, visited: inout [Bool], words: inout [String]) -> Int {
    var stack = [(begin, 0)]
    var head = 0
    while head < stack.count {
        let (cur, routeCount) = stack[head]
        if cur == target {
            return routeCount
        }
        
        for i in 0..<words.count {
            if visited[i] == true {
                continue
            }
            if isChangeable(a: cur, b: words[i]) {
                visited[i] = true
                stack.append((words[i], routeCount + 1))
            }
        }
        head += 1
    }
    
    return 0
}

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    
    var visited = Array(repeating: false, count: words.count)
    var words = words
    var now_word = begin
    
    if !words.contains(target) {
        return 0
    }
    
    let answer = bfs(begin: begin, target: target, visited: &visited, words: &words)
    
    return answer
}

print(solution("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"]))
