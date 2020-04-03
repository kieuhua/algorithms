# basic singly linked list
class Node
    attr_accessor :value, :next      
    def initialize(val)
        @value = val
        @next = nil
    end
end
def reverse_list(list)
    # add the last node to the reverse list
    node = Node.new(list.value)
    rev_tail = node
    cur_l = list.next
    reverse_l = reverse_helper(rev_tail, cur_l)
end
def reverse_helper( rList, cList)
    if cList.nil?
        return rList
    end
    node = Node.new(cList.value)
    node.next = rList
    rList = node
    cList = cList.next
    reverse_helper(rList, cList)
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

arr1 = [ 7, 9,2,4,3, 8]
arr2 = [ 3, 10,1,11,6, 5, 7, 12]
l1 = createList(arr1)
l2 = createList(arr2)
r_l1 = reverse_list(l1)
p printList(r_l1)       # [8, 3, 4, 2, 9, 7]
r_l2 = reverse_list(l2)
p printList(r_l2)       # [12, 7, 5, 6, 11, 1, 10, 3]
