module Enumerable
  # 1. each

  # 1. each
  def my_each
    return self.to_enum unless block_given?

    arr = to_a
    (0..(arr.length - 1)).each do |i|
      yield(arr[i])
    end
    self
  end

end
# 10. multiply_els
def multiply_els(array)
  array.my_inject { |product, elem| product * elem }
end

# The Test array that I use to test the methods below
ARRAY_SIZE = 100
LOWEST_VALUE = 0
HIGHEST_VALUE = 9
# passes
array = Array.new(ARRAY_SIZE) { rand(LOWEST_VALUE...HIGHEST_VALUE) }
# failed
block = proc { |num| num < (LOWEST_VALUE + HIGHEST_VALUE) / 2 }
# passed
words = %w[dog door rod blade]
#  passed
range = Range.new(5, 50)
#  passed
hash = { a: 1, b: 2, c: 3, d: 4, e: 5 }
# passed
numbers = [1, 2i, 3.14]
# passed
array_clone = array.clone


# 1. each
    block.each {|item| print item}
    block.my_each {|item| print item}

# 2. each_with_index
# test_array.each_with_index {|item,i| puts "Index: #{i} Item: #{item}"}
# test_array.my_each_width_index {|item,i| puts "Index: #{i} Item: #{item}"}

# 3. select
# print test_array.select {|item| item.even? }
# print test_array.my_select {|item| item.even? }

# 4. all?
# print test_array.all? {|item| item.is_a? Integer}
# print test_array.all? {|num| item.is_a? String}
# print test_array.my_all? {|item| item.is_a? Integer}
# print test_array.my_all? {|item| item.is_a? String}

# 5. any?
# print test_array.any? {|item| item.is_a? Integer}
# print test_array.any? {|item| item.is_a? String}
# print test_array.my_any? {|item| item.is_a? Integer}
# print test_array.my_any? {|item| item.is_a? String}

# 6. none?
# print test_array.none? {|item| item.is_a? String}
# print test_array.none? {|item| item.is_a? Integer}
# print test_array.my_none? {|item| item.is_a? String}
# print test_array.my_none? {|item| item.is_a? Integer}

# 7. count
# print test_array.count {|item| item < 4}
# print test_array.count(5)
# print test_array.count
# print test_array.my_count {|item| item < 4}
# print test_array.my_count(5)
# print test_array.my_count

# 8. map# def my_each
#   return to_enum(:my_each) unless block_given?
#   array_item = 0
#   self_length = self.length
#   while array_item < self_length
#     yield(self[array_item])                         if self.is_a?(Array)
#     yield(keys[array_item], self[keys[array_item]]) if self.is_a?(Hash)
#     yield([to_a[array_item]])                       if self.is_a?(Range)
#    array_item += 1
#   end
#   puts self
# end

# end

# test_block = Proc.new {|elem| elem * 2}
# print test_array.map {|item| item * 2 }
# print test_array.map(&test_block)
# print test_array.my_map {|item| item * 2 }
# print test_array.my_map(&test_block)

# 9. inject
# print test_array.inject {|result,elem| result + elem}
# print test_array.my_inject {|result,elem| result + elem}

# 10.  multiply_els
# def multiply_els(array)
#   puts array.inject {|result,elem| result*elem }
#   puts array.my_inject {|result,elem| result*elem }
# end
#  print multiply_els(test_array)
