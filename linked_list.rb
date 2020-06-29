class Node
    attr_accessor :value, :next_node
    def initialize(value = nil, next_node = nil)
        @value = value
        @next_node = next_node
    end
end

class LinkedList
    
    attr_accessor :head, :tail, :size
    def initialize()
        @head = Node.new
        @tail = @head
    end

    def append(value)
        if @head.value == nil
            @head.value = value
        else
            @tail.next_node = Node.new
            @tail = @tail.next_node
            @tail.value = value
        end

        @size += 1
    end

    def prepend(value)
        temp = NOde.new
        temp.value = value
        temp.next_node = @head
        @head = temp

        @size += 1
    end

    def size()
        puts "Size of the linked list is #{@size}"
    end

    def head()
        puts "Value of the first node is #{@head.value}"
    end

    def tail()
        puts "Value of the last node is #{@tail.node}"
    end

    def at(index)
        temp = @head
        i = 0
        while (i <= index)
            temp = temp.next_node
        end

        puts "Value of node at index #{index} is #{temp.value}"
    end

    def pop()
        temp = head
        while (temp.next_node != @tail)
            temp = temp.next_node
        end

        temp.next_node = nil
        @tail = temp
    end

    def contains?(value)
        temp = @head
        while (temp != nil)
            if temp.value == value
                return true
            end

            temp = temp.next_node
        end

        return false
    end

    def find(value)
        idx = 0

        while (temp != nil)
            if temp.value == value
                return idx
            end

            temp = temp.next_node
            idx += 1
        end

        return temp
    end

    def to_s()
        temp = @head

        while (temp != nil)
            print "(#{temp.value}) ->"
        end

        print temp
        puts "\n"
    end
end

#NEED TO TEST THIS CODE!!!