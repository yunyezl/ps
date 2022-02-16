import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int {
    var answer:Int64 = -1
    var money = money
    var price = price
    
    for i in 1..<count+1 {
        money -= price * i
    }
    
    return money < 0 ? -(money) : 0
}
