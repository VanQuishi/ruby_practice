class Node
    attr_accessor :value, :left_child, :right_child
    def initialize(value = nil, left_child = nil, right_child = nil)
        @value = value
        @left_child = left_child
        @right_child = right_child
    end
end

class Tree
    attr_accessor :root, :data_array
    def initialize(data_array = [])
        @data_array = data_array.sort.uniq
        @root = build_tree(@data_array)
    end

    def build_tree(data_array)
        temp_node = Node.new
        mid = data_array.length / 2
        temp_node.value = data_array[mid]
        temp_node.left_child = Node.new
        temp_node.right_child = Node.new


        for i in 0..data_array.length - 1
            if data_array[i] < temp_node.value
                insert(data_array[i], temp_node.left_child)
            elsif data_array[i] > temp_node.value
                insert(data_array[i], temp_node.right_child)
            end
        end

        return temp_node
    end

    def insert(value, curr_node)
        if curr_node.value == nil
            curr_node.value = value
            curr_node.left_child = Node.new
            curr_node.right_child = Node.new

        else
            if value < curr_node.value 
                insert(value, curr_node.left_child)
            elsif value > curr_node.value
                insert(value, curr_node.right_child)
            end
        end 
    end

    def delete(deleted_value, curr_node = @root) #NOT DONE!!! #Fix leaf case and root case

        if deleted_value < curr_node.value
            delete(deleted_value, curr_node.left_child)

        elsif deleted_value > curr_node.value
            delete(deleted_value, curr_node.right_child)

        elsif deleted_value == curr_node.value
            if isLeaf(curr_node)
                temp_node = Node.new
                curr_node = temp_node
            else
                temp_node = curr_node

                #look for the largest value of the left subtree of curr_node
                #replace curr_node value with this value
                while (!isLeaf(temp_node))
                    if temp_node.right_child.value != nil
                        temp_node = temp_node.right_child
                    else
                        temp_node = temp_node.left_child
                    end
                end
                curr_node.value = temp_node.value
                temp_node.value = nil
            end  
        end 
    end

    def find(value, curr_node = @root)
        if value == curr_node.value
            return curr_node
        elsif value != curr_node.value && isLeaf(curr_node)
            puts "Value is not found    "
            return false
        elsif value < curr_node.value
            find(value, curr_node.left_child)
        elsif value > curr_node.value
            find(value, curr_node.right_child)
        end
    end

    def level_order()
    end

    def inorder(curr_node = @root)
        if curr_node.value == nil
            return
        else
            inorder(curr_node.left_child)
            puts curr_node.value
            inorder(curr_node.right_child)
        end
    end

    def preorder(curr_node = @root)
        if curr_node.value == nil
            return
        else
            puts curr_node.value
            preorder(curr_node.left_child)
            preorder(curr_node.right_child)
        end
    end

    def postorder(curr_node = @root)
        if curr_node.value == nil
            return
        else
            postorder(curr_node.left_child)
            postorder(curr_node.right_child)
            puts curr_node.value
        end
    end

    def depth()
    end

    def balanced?()
    end

    def rebalance()
    end

    def isLeaf(curr_node)
        if curr_node.left_child.value == nil && curr_node.right_child.value == nil
            return true
        end
        return false
    end
end

a = [2,3,7,6,6,8]
myTree = Tree.new(a)
myTree.inorder()
puts "===="
myTree.preorder()
puts "===="
myTree.postorder()
p myTree.data_array

p myTree.find(2)
p myTree.find(9)

myTree.delete(7)
myTree.inorder()
puts "===="
myTree.delete(8)
myTree.inorder()
