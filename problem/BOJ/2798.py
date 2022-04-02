import sys
input = sys.stdin.readline
n, m = map(int, input().split())
card = list(map(int, input().split()))
diff = sys.maxsize
currentSum = 0
visited = [False for _ in range(n)]

def backtracking(depth, cards):
    global diff, currentSum
    
    if depth == 3:
        sumValue = sum(cards)
        if abs(m - sumValue) < diff and sumValue <= m:
            diff = abs(m - sumValue)
            currentSum = sumValue
        return
    
    for i in range(n):
        if not visited[i]:
            visited[i] = True
            backtracking(depth + 1, cards + [card[i]])
            visited[i] = False
    
backtracking(0, [])
print(currentSum)
        

