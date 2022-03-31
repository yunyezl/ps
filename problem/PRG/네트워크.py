from collections import deque

def solution(n, computers):
    answer = 0
    global visited, graph, queue
    visited = [False for _ in range(n + 1)]
    graph = [[] for _ in range(n+1)]
    queue = deque([])
    
    for i in range(n):
        for j in range(n):
            if computers[i][j] == 1 and i != j:
                graph[i+1].append(j+1)        
    
    def bfs(start):
        global visited, grpah, queue
        queue.append(start)
        while queue:
            node = queue.popleft()
            visited[node] = True
            for g in graph[node]:
                if not visited[g]:
                    queue.append(g)
    
    for i in range(n):
        if not visited[i+1]:
            bfs(i+1)
            answer += 1
            
    return answer
