func solution(_ s:String) -> Bool {
    if let _ = Int(s) {
        if s.count == 4 || s.count == 6 {
            return true
        } 
        return false
    }
    return false
}
