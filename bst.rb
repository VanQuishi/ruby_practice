class Node
    attr_accessor :value, :left_child, :right_child
    def initialize(value = nil, depth_value = 0, left_child = nil, right_child = nil)
        @value = value
        @depth_value = depth_value
        @left_child = left_child
        @right_child = right_child
    end
end

class Tree
    attr_accessor :root, :data_array
    def initialize(input_array = [])
        @root = build_tree(input_array)
    end

    def build_tree(input_array) #done
        @data_array = input_array.sort.uniq
        temp_node = Node.new
        mid = @data_array.length / 2
        temp_node.value = @data_array[mid]
        temp_node.left_child = Node.new
        temp_node.right_child = Node.new


        for i in 0..@data_array.length - 1
            if @data_array[i] < temp_node.value
                insert(@data_array[i], temp_node.left_child)
            elsif @data_array[i] > temp_node.value
                insert(@data_array[i], temp_node.right_child)
            end
        end

        return temp_node
    end

    def insert(value, curr_node = @root)  #done
        if curr_node.value == nil
            curr_node.value = value
            curr_node.left_child = Node.new
            curr_node.right_child = Node.new
            return curr_node
        else
            if value < curr_node.value 
                insert(value, curr_node.left_child)
            elsif value > curr_node.value
                insert(value, curr_node.right_child)
            end
        end 
    end

    def delete(deleted_value, curr_node = @root)   #done
        #puts "Value to delete: #{deleted_value}"
        #puts "current node value: #{curr_node.value}"
        if curr_node.value == nil
            return curr_node
        elsif deleted_value < curr_node.value
            curr_node.left_child = delete(deleted_value, curr_node.left_child)

        elsif deleted_value > curr_node.value
            curr_node.right_child = delete(deleted_value, curr_node.right_child)

        elsif deleted_value == curr_node.value
            if isLeaf(curr_node)   #no child case
                curr_node.value = nil
            else
                #1 child case
                if curr_node.left_child.value == nil
                    curr_node = curr_node.right_child
                elsif curr_node.right_child.value == nil
                    curr_node = curr_node.left_child
                #2 children case
                else
                    #find max value in the left subtree
                    max_node = findMax(curr_node.left_child)
                    #copy max value to curr_node
                    curr_node.value = max_node.value
                    #delete max node in left subtree
                    delete(max_node.value, max_node)
                end
            end
        end
        return curr_node
    end

    def find(value, curr_node = @root)  #done
        if value == curr_node.value
            return curr_node
        elsif value != curr_node.value && isLeaf(curr_node)
            puts "Value is not found"
            return false
        elsif value < curr_node.value
            find(value, curr_node.left_child)
        elsif value > curr_node.value
            find(value, curr_node.right_child)
        end
    end

    def level_order()  #done
        level_order_arr = []
        queue = Queue.new
        queue << @root

        while (!queue.empty?)
            temp_node = queue.pop
            level_order_arr.push(temp_node.value)
            if (temp_node.left_child.value != nil)
                queue << temp_node.left_child
            end

            if (temp_node.right_child.value != nil)
                queue << temp_node.right_child
            end
        end

        return level_order_arr
    end

    def inorder(curr_node = @root)  #done
        if curr_node.value == nil
            return
        else
            inorder(curr_node.left_child)
            puts curr_node.value
            #puts "Its depth #{depth(curr_node)}"
            inorder(curr_node.right_child)
        end
    end

    def preorder(curr_node = @root)   #done
        if curr_node.value == nil
            return
        else
            puts curr_node.value
            preorder(curr_node.left_child)
            preorder(curr_node.right_child)
        end
    end

    def postorder(curr_node = @root)  #done
        if curr_node.value == nil
            return
        else
            postorder(curr_node.left_child)
            postorder(curr_node.right_child)
            puts curr_node.value
        end
    end

    def depth(curr_node)    #done
        if curr_node.value == @root.value
            return 0
        else
            depth_value = 0
            temp_node = @root
            while (curr_node.value != temp_node.value)
                if curr_node.value < temp_node.value
                    temp_node = temp_node.left_child
                    depth_value += 1
                elsif curr_node.value > temp_node.value 
                    temp_node = temp_node.right_child
                    depth_value += 1
                end
            end
            return depth_value
        end
    end

    def max(a,b)
        return a >= b ? a : b
    end

    def height(curr_node = @root)
        if (curr_node.value == nil)
            return 0
        else
            return 1 + max(height(curr_node.left_child), height(curr_node.right_child))
        end
    end

    def balanced?()  #done
        #if the difference in height between left and right subtrees is no more than 1 => balanced
        left_tree_height = height(@root.left_child)
        right_tree_height = height(@root.right_child)
        difference = left_tree_height - right_tree_height

        if difference.between?(-1,1)   #check is difference is within range of -1 to 1
            return true
        else
            return false
        end
    end

    def rebalance()
        level_order_arr = level_order()
        @root = build_tree(level_order_arr)
    end

    def isLeaf(curr_node)  #done
        if curr_node.left_child.value == nil && curr_node.right_child.value == nil
            return true
        end
        return false
    end

    def findMax(curr_node = @root)   #done
        if (curr_node.right_child.value == nil)
            return curr_node
        else
            return findMax(curr_node.right_child)
        end
    end

    def inorderlvl(curr_node = @root,x)
        if @root.value == nil 
            return
        elsif x == 1 
            puts "#{curr_node.value}"
		elsif x > 1
			inorderlvl(curr_node.left_child, x-1);
            inorderlvl(curr_node.right_child, x-1);
        end
    end

    def pretty_print(node = @root, prefix="", is_left = true)
        pretty_print(node.right_child, "#{prefix}#{is_left ? "│ " : " "}", false) if node.right_child
        puts "#{prefix}#{is_left ? "└── " : "┌── "}#{node.value}"
        pretty_print(node.left_child, "#{prefix}#{is_left ? " " : "│ "}", true) if node.left_child
    end
end

a = [3,2,4,6,6,7,8]
myTree = Tree.new(a)
puts "root is #{myTree.root.value}"
puts "root depth is #{myTree.depth(myTree.root)}"
puts "Inorder traversal:"
myTree.inorder()
puts "===="
puts "Preorder traversal:"
myTree.preorder()
puts "===="
puts "Postorder traversal:"
myTree.postorder()
p myTree.data_array
puts "The tree is balanced: #{myTree.balanced?()}"

puts "Find 2:"
p myTree.find(2)
puts "\n"
puts "===="
puts "Find 9:"
p myTree.find(9)

myTree.insert(10)
puts "Depth of 10: #{myTree.depth(myTree.find(10))}"

myTree.insert(9)
myTree.insert(11)
myTree.insert(1)
myTree.insert(5)

puts "Depth of 5: #{myTree.depth(myTree.find(5))}"

puts "===="
puts"The OG array:"
myTree.inorder()

puts "===="
#delete leaf     #success
p myTree.isLeaf(myTree.find(1))  #returns true
myTree.delete(1)
myTree.inorder()

#delete 1 child node  #success
myTree.delete(4)
myTree.inorder()

#delete 2 children node  #Success babyy
myTree.delete(10)
myTree.inorder()

#delete root 0_o
myTree.delete(6)
myTree.inorder()

puts "===="
p myTree.level_order()

puts "The tree is balanced: #{myTree.balanced?()}"

myTree.rebalance()
puts "The tree is balanced: #{myTree.balanced?()}"

myTree.pretty_print()
