def pascal_triangle(k)
    arr = []
    # special cases
    arr[0] = [1]
    arr[1] = [1,1]
    2.upto(k) do |n|
        # the row is always start with 1
        arr[n] = oneRow(arr[n-1], 1, [1])
    end
    arr[k]
end

def oneRow(prev_row, cur_idx, cur_row)
    if cur_idx > prev_row.size 
        return cur_row
    end
    sum = 0
    # the current value of the current row at the cur_idx
    # is the sum of the value of the previous row at cur_idx-1 and cur_idx
    sum += prev_row[cur_idx - 1] unless prev_row[cur_idx - 1].nil?
    sum += prev_row[cur_idx] unless prev_row[cur_idx].nil?
    cur_row[cur_idx] = sum
    oneRow(prev_row, cur_idx + 1, cur_row)
end

p pascal_triangle(2)        #   [1, 2, 1]
p pascal_triangle(3)        #   [1, 3, 3, 1]
p pascal_triangle(4)        #   [1, 4, 6, 4, 1]
p pascal_triangle(5)        #   [1, 5, 10, 10, 5, 1]
