def solution(n, k, cmd):
    answer = ['O' for i in range(n)]
    linked_list = [[i - 1, i + 1] for i in range(0, n)]
    del_store = []
    for c in cmd:
        c = c.split(" ")
        if c[0] == "U":
            for _ in range(int(c[1])):
                k = linked_list[k][0]
        elif c[0] == "D":
            for _ in range(int(c[1])):
                k = linked_list[k][1]
        elif c[0] == "C":
            prev, next = linked_list[k]
            del_store.append(k)
            answer[k] = "X"
            if next == n:
                k = linked_list[k][0]
            else:
                k = linked_list[k][1]
            if prev == -1:
                linked_list[next][0] = -1
            elif next == n:
                linked_list[prev][1] = next
            else:
                linked_list[prev][1] = next
                linked_list[next][0] = prev
        elif c[0] == "Z":
            recent = del_store.pop()
            answer[recent] = "O"
            prev, next = linked_list[recent]
            if prev == -1:
                linked_list[next][0] = recent
            elif next == n:
                linked_list[prev][1] = recent
            else:
                linked_list[prev][1] = recent
                linked_list[next][0] = recent
            
    return "".join(answer)
