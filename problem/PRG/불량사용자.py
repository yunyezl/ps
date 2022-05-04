def solution(user_id, banned_id):
    answer = 1
    all = []
    for i, ban in enumerate(banned_id):
        temp = []
        for user in user_id:
            if len(user) == len(ban):
                for j in range(len(ban)):
                    if user[j] == ban[j] or ban[j] == "*":
                        continue
                    else:
                        break
                else:
                    temp.append(user)
        all.append(temp)

    cases = []

    def dfs(i, select):
        if len(select) == len(banned_id):
            if sorted(select) not in cases:
                cases.append(sorted(select))
            return

        arr = all[i]
        for a in arr:
            if a in select:
                continue
            select.append(a)
            dfs(i + 1, select)
            select.pop()

    dfs(0, [])
    return len(cases)
