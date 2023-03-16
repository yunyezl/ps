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
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        if inorder.count == 0 {
            return nil
        }
        
        
        let root = TreeNode(postorder.last!)
        let index = inorder.firstIndex(of: postorder.last!)!
        
        let leftInorder = Array(inorder[0..<index])
        let rightInorder = Array(inorder[(index+1)...])
        
        let leftPostorder = Array(postorder[0..<leftInorder.count])
        let rightPostorder = Array(postorder[leftInorder.count..<(postorder.count-1)])
        
        root.left = buildTree(leftInorder, leftPostorder)
        root.right = buildTree(rightInorder, rightPostorder)
        
        return root
    }
}