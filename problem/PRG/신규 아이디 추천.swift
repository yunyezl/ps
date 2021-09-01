import Foundation

func solution(_ new_id: String) -> String {
    
    let lowerNewId = new_id.lowercased()
    var newId = ""
    
    for i in lowerNewId {
        if i.isLetter || i.isNumber || i == "-" || i == "_" || i == "."{
            newId += String(i)
        }
    }
    
    while newId.contains("..") {
        newId = newId.replacingOccurrences(of: "..", with: ".")
    }
    
    if newId.last == "." {
        newId.removeLast()
    }
    if newId.first == "." {
        newId.removeFirst()
    }
    
    if newId.isEmpty {
        newId = "a"
    }
    
    if newId.count >= 16 {
        let index = newId.index(newId.startIndex, offsetBy: 15)
        newId = String(newId[newId.startIndex..<index])
        if newId.hasSuffix(".") {
            newId.removeLast()
        }
    }
    
    if newId.count <= 2 {
        while newId.count != 3 {
            newId = newId + String(newId.last!)
        }
    }
    
    return String(newId)
}
