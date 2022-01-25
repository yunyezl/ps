func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    let report = Array(Set(report))
    var dic: [String: [String]] = [:]
    var answer = Array(repeating: 0, count: id_list.count)
    
    var ids: [String: Int] = [:]
     
     for (index, id) in id_list.enumerated() {
         ids[id] = index
     }
    
    report.forEach { list in
        let splited = list.split(separator: " ").map { String($0) }
        if let _ = dic[splited[1]] {
            dic[splited[1]]!.append(splited[0])
        } else {
            dic[splited[1]] = [splited[0]]
        }
    }
    
    for name in dic.keys {
        if dic[name]!.count >= k {
            for n in dic[name]! {
                answer[ids[n]!] += 1
            }
        }
    }
    return answer
}
