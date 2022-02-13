func solution(_ strings:[String], _ n:Int) -> [String] {
    var answers: [String] = []
    let stringWithOffset = strings.enumerated().map { ($0, Array($1)[n]) }
    stringWithOffset.sorted { 
        if $0.1 == $1.1 { return strings[$0.0] < strings[$1.0] }
        return $0.1 < $1.1
    }
    .map { $0.0 }
    .forEach { 
        answers.append(strings[$0])
    }
    return answers
}
