#Design and implement a method that swaps alternate nodes in a singly linked list. e.g. 
#If the input is 1->2->3->4 then after the method is executed, the linked list should become 2->1->4->3.

# basic singly linked list node, Ruby is pass in value not reference
class Node
    attr_accessor :value, :next     
    def initialize(val)
        @value = val
        @next = nil
    end
end

def swapNodesInPairs(head)
   swap_helper(head, head, head)
end

# args: 
# head is the 1st node to the swap list,
# tail is the node that its pointer is the current swap list 
# cur_l is the current list to be swapped
def swap_helper(head, tail, cur_l) 
    if cur_l.nil? || cur_l.next.nil?
        return head
    end
    temp = cur_l    
    temp_next = cur_l.next
    temp_next_next = cur_l.next.next  
    # swap current node with the next node
    cur_l = temp_next    
    cur_l.next = temp
    cur_l.next.next = temp_next_next
   
    if head == tail
        # on the 1st time, the head needs to be updated, 
        head = cur_l       
    else  
        # change the previous tail to point to current swapped list
        tail.next = cur_l
    end
    # update the tail for the next call
    tail = cur_l.next
   
    swap_helper(head, tail, temp_next_next)    
end

# create a list for testing
def createList(arr)
    head = Node.new(arr[0])
    cur_node = head
    arr.shift
    arr.each do |val|
        node = Node.new(val)
        cur_node.next = node
        cur_node = node
    end
    head
end
# create print list to verify the list
def printList(head)
    result = []
    cur = head
    while ( cur != nil)
         result << cur.value
        cur = cur.next
    end
    result
end

arr = [1,2,3,4]     # [ 2, 1, 4, 3]
arr2 = [1,2,3,4,5]  # [2, 1, 4, 3, 5]
arr3 = [1,2,3,4,5,6,7,8,9,10]   # [2, 1, 4, 3, 6, 5, 8, 7, 10, 9]
l1 = createList(arr3)   # [2, 1, 4, 3, 5]
l2 = swapNodesInPairs(l1)
p printList(l2)     
