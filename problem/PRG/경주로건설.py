from collections import deque

def bfs(y, x, d, cost):
    global minCost
    dx = [1, 0, -1, 0]
    dy = [0, 1, 0, -1]
    q = deque([])
    q.append((y, x, d, cost))
    money = [[int(1e9)] * n for _ in range(n)]
    while q:
        y, x, direction, cost = q.popleft()
        if y == n - 1 and x == n - 1:
            if cost < minCost:
                minCost = cost
        for d in range(4):
            ny = y + dy[d]
            nx = x + dx[d]
            if abs(d - direction) == 0 or abs(d - direction) == 0:
                new_cost = cost + LINE_COST
            else:
                new_cost = cost + LINE_COST + CORNER_COST
            if ny >= n or ny < 0 or nx >= n or nx < 0:
                continue
            if not new_board[ny][nx] and money[ny][nx] > new_cost:
                q.append((ny, nx, d, new_cost))
                money[ny][nx] = new_cost

def solution(board):
    global LINE_COST, CORNER_COST, minCost, new_board, n
    n = len(board)
    LINE_COST = 100
    CORNER_COST = 500
    new_board = board
    minCost = int(1e9)
    
    bfs(0, 0, 0, 0)
    bfs(0, 0, 1, 0)
