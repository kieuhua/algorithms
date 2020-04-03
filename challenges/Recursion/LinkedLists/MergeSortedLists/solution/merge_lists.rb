# basic single linked list
class Node
   attr_accessor :value, :next      # this is import
    def initialize(val)
        @value = val
        @next = nil
    end
end

def merge_lists(list1, list2)
    resultList = nil
    # create the first node for resultList
    if list1.value < list2.value
        node = Node.new(list1.value)
        list1 = list1.next
    else
        node = Node.new(list2.value)
        list2 = list2.next
    end
    resultList = node
    merge_helper(resultList, list1, list2)
    resultList
end

def merge_helper(cur_rList, cur_l1, cur_l2)
    # the recursive end at the end of one of the lists
    if (cur_l1.nil? || cur_l2.nil?)
        # need to merge the longer list before return
        remain_l = cur_l1    unless cur_l1.nil?
        remain_l = cur_l2    unless cur_l2.nil?
        while !remain_l.nil?
            node = Node.new(remain_l.value)
            cur_rList.next = node
            cur_rList = cur_rList.next
            remain_l = remain_l.next
        end
        return 
    end
    # compare two list the their current node
    # then add the small value node to the result list
    if cur_l1.value < cur_l2.value
        node = Node.new (cur_l1.value)
        cur_rList.next = node
        cur_l1 = cur_l1.next
    else  
        node = Node.new (cur_l2.value)
        cur_rList.next = node
        cur_l2 = cur_l2.next
    end
    cur_rList = cur_rList.next
    merge_helper(cur_rList, cur_l1, cur_l2)
end

# create a sort list for testing
def createList(arr)
    s_arr = arr.sort
    head = Node.new(s_arr[0])
    cur_node = head
    s_arr.shift
    s_arr.each do |val|
        node = Node.new(val)
        cur_node.next = node
        cur_node = node
    end
    head
end
# create print list for verify the list
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
p printList(l1)        # [2, 3, 4, 7, 8, 9]
p printList(l2)        # [1, 3, 5, 6, 7, 10, 11, 12]
l3 =  merge_lists(l1, l2)
p printList(l3)         # [1, 2, 3, 3, 4, 5, 6, 7, 7, 8, 9, 10, 11, 12]
