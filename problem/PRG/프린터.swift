func solution(_ priorities:[Int], _ location:Int) -> Int {
    
    var idx: Int = location
    var docs: [Int] = priorities
    var printed: [Int] = []
    var answer = 0
    
    while true {
        if docs.contains(where: { $0 > docs[0] } ) {
            docs.append(docs.removeFirst())
        } else if idx == 0 {
            printed.append(docs.removeFirst())
            answer = printed.count
            break
        } else {
            printed.append(docs.removeFirst())
        }
        
        idx -= 1
        if idx < 0 {
            idx = docs.count-1
        }
    }
    
    return answer
}
