
func solution(_ files:[String]) -> [String] {
    enum State {
        case head, number, tail
    }

    var slideArray: [[String]] = []
    files.forEach { file in
        let file = Array(file)
        var head = ""
        var number = ""
        var tail = ""
        var flag = State.head
        
        for char in file {
            if flag == .head {
                if let _ = Int(String(char)) {
                    number += String(char)
                    flag = .number
                } else {
                    head += String(char)
                }
            } else if flag == .number {
                if let _ = Int(String(char)) {
                    number += String(char)
                } else {
                    tail += String(char)
                    flag = .tail
                }
            } else {
                tail += String(char)
            }
        }
        
        slideArray.append([head, number, tail])
    }
    
    slideArray.sort { first, second in
        let first = first.map { $0.lowercased() }
        let second = second.map { $0.lowercased() }
        if first[0] == second[0] {
            if Int(first[1])! == Int(second[1]) {
                return false
            }
            return Int(first[1])! < Int(second[1])!
        }
        return first[0] < second[0]
    }
    
    return slideArray.map {
        $0.joined(separator: "")
    }
}
