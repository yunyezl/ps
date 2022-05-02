from collections import deque

def bfs(place):
    start = []
    for i in range(5):
        for j in range(5):
            if place[i][j] == "P":
                start.append((i, j))
    
    dx = [-1, 1, 0, 0]
    dy = [0, 0, -1, 1]
    
    for s in start:
        visited = [[False] * 5 for _ in range(5)]
        queue = deque([(s[0], s[1], 0)])
        visited[s[0]][s[1]] = True
        while queue:
            x, y, distance = queue.popleft()
            for i in range(4):
                nx = x + dx[i]
                ny = y + dy[i]
                if 0 <= nx < 5 and 0 <= ny < 5 and visited[nx][ny] == False:
                    if place[nx][ny] == 'O':
                        queue.append((nx, ny, distance + 1))
                        visited[nx][ny] = True
                    if place[nx][ny] == 'P' and distance + 1 <= 2:
                        return 0
    return 1

def solution(places):
    answer = []

    for place in places:
        answer.append(bfs(place))
        
    return answer
