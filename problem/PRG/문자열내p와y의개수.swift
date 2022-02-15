import Foundation

func solution(_ s:String) -> Bool
{
    var ans: Bool = false
    
    let pCount = s.uppercased().filter({ $0 == "P" }).count
    let yCount = s.uppercased().filter({ $0 == "Y" }).count

    return pCount == yCount
}
