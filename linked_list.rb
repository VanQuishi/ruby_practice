class Node
    attr_accessor :value, :next_node
    def initialize(value = nil, next_node = nil)
        @value = value
        @next_node = next_node
    end
end

class LinkedList
    
    attr_reader :head, :tail, :size
    def initialize()
        @head = Node.new
        @tail = @head
        @size = 0
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
        temp = Node.new
        temp.value = value
        temp.next_node = @head
        @head = temp

        @size += 1
    end

    def insert_at(value,index)
        if index < 0 || index > @size
            puts "Invalid position"
            return
        elsif index == 0
            prepend(value)
        elsif index == @size
            append(value)
        else
            temp = @head
            node_added = Node.new
            node_added.value = value

            i = 0
            while (i < index - 1)
                temp = temp.next_node
                i += 1
            end

            temp_2 = temp.next_node
            temp.next_node = node_added
            node_added.next_node = temp_2
        end
        @size += 1
    end

    def remove_at(index)
        if index < 0 || index >= @size
            outs "Invalid position"
            return
        else
            temp = @head
            i = 0
            while (i < index - 1)
                temp = temp.next_node
                i += 1
            end

            deleted_node = temp.next_node
            temp.next_node = deleted_node.next_node
            deleted_node = nil
            @size -= 1
        end
    end

    def size()
        puts "Size of the linked list is #{@size}"
    end

    def head()
        if @head.value == nil
            puts "Value of the first node is nil"
        else
            puts "Value of the first node is #{@head.value}"
        end
    end

    def tail()
        if @tail.value == nil
            puts "Value of the last node is nil"
        else
            puts "Value of the last node is #{@tail.value}"
        end
    end

    def at(index)
        if index == @size
            puts "There is no node at this index"
            return
        elsif index == 0
            temp = @head
        else
            temp = @head
            i = 0
            while (i < index)
                temp = temp.next_node
                i += 1
            end
        end
        puts "Value of node at index #{index} is #{temp.value}"
    end

    def pop()
        temp = @head
        while (temp.next_node != @tail)
            temp = temp.next_node
        end

        temp.next_node = nil
        @tail = temp
        @size -= 1
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
        temp = @head
        idx = 0

        while (temp != nil)
            if temp.value == value
                return idx
            end

            temp = temp.next_node
            idx += 1
        end

        return "not found"
    end

    def to_s()
        temp = @head

        while (temp.next_node != nil)
            print "(#{temp.value}) -> "
            temp = temp.next_node
        end

        print "(#{temp.value})"
        puts "\n"
    end
end


myList = LinkedList.new

myList.head()

myList.append(5)
myList.append(6)

myList.head()
myList.tail()
myList.to_s()

myList.prepend(1)
myList.to_s()
myList.size()

myList.at(2)
myList.at(3)

myList.append(7)
myList.append(8)
myList.to_s()
myList.pop()
puts "The last node is removed"
myList.to_s()

p myList.contains?(8)
p myList.contains?(7)

puts "Looking for the index of 7: #{myList.find(7)}"
puts "Looking for the index of 2: #{myList.find(2)}"

myList.insert_at(4,3)
myList.to_s()

myList.insert_at(-1, -1)
myList.to_s()

myList.insert_at(12,4)
myList.to_s()

myList.remove_at(4)
myList.to_s()
myList.size()
