func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    var result: [[Int]] = Array(repeating: [], count: banned_id.count)
    for (index, banID) in banned_id.enumerated() {
        for (i, userID) in user_id.enumerated() {
            if userID.count != banID.count { continue }
            let starIndex = banID.enumerated().filter { $1 == "*" }.map { $0.offset }
            var tempBanID = banID.map { String($0) }
            let tempUserID = userID.map { String($0) }
            starIndex.forEach { tempBanID[$0] = tempUserID[$0] }
            if tempUserID.joined() == tempBanID.joined() {
                result[index].append(i)
            }
        }
    }
    var set = Set<[Int]>()
    func combinate(i: Int, select: [Int]) {
        if select.count == banned_id.count {
            set.update(with: select.sorted())
            return
        }
        var select = select
        let arr = result[i]
        for n in arr {
            if select.contains(n) { continue }
            select.append(n)
            combinate(i: i+1, select: select)
            select.removeLast()
        }
    }
    combinate(i: 0, select: [])
    return set.count
}
