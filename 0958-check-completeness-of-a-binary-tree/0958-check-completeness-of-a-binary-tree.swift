/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func isCompleteTree(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        
        var queue = [(root, 1)]
        var head = 0
        
        while head < queue.count {
            let (node, index) = queue[head]
            head += 1
            
            if let left = node.left {
                queue.append((left, index * 2))
            } 
            if let right = node.right {
                queue.append((right, index * 2 + 1))
            }
            
            if head < queue.count && queue[head].1 != index + 1 {
                return false
            }
        }
        
        return true
    }
}
