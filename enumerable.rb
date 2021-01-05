module Enumerable
  #1. each
      def my_each
        return to_enum(:my_each) unless block_given?
    
        index = 0
        while index < size
          if is_a?(Array)
            yield(self[index])
          elsif is_a?(Range)
            yield(to_a[index])
          end
          index += 1
        end
      if is_a?(Hash)
           yield(keys.zip(values))
      end
    end
    

  #2. my_each_width_index
  def my_each_width_index
    return to_enum(:my_each) unless block_given?
    index = 0
    while index < size 
    if is_a?(Array)
        yield(self[index], index)
        index += 1
    elsif is_a?(Range)
        yield(to_a[index], index)
        index += 1
    elsif is_a?(Hash)
      value = 0
      while value < size
        yield([keys[value], values[value]])
        value += 1
      end
    end
    end
    self
  end

  #3. my_select
  def my_select
    return to_enum unless block_given?
    new_array = []
    my_each do |item|
      new_array.push(item) if yield(item)
    end
    new_array
  end

  #4. my_all?
  def my_all?
    return to_enum unless block_given?
    return false if nil?
    my_each do |item|
      return false unless yield(item)
    end
    true
  end

  #5. my_any?
  def my_any?(param = nil)
    return my_any? { |obj| obj } unless block_given? || !param.nil?

    my_each do |item|
      return true if param.is_a?(Class) && item.is_a?(param)
      return true if param.instance_of?(Regexp) && item.to_s.match(param.to_s)
      return true if block_given? && yield(item)
      return true if param.is_a?(Integer) && param == item
      return true if param.is_a?(String) && param == item
    end
    false
  end

  #6. my_none?
  def my_none?(param = nil)
    return my_none? { |obj| obj } unless block_given? || !param.nil?

    my_each do |item|
      return false if param.is_a?(Class) && item.is_a?(param)
      return false if param.instance_of?(Regexp) && item.to_s.match(param.to_s)
      return false if block_given? && yield(item)
      return false if param.is_a?(Integer) && param == item
      return false if param.is_a?(String) && param == item
    end
    true
  end

  #7. my_count
  def my_count
    item = nil
    count = 0
    if item
      my_each { |elem| count += 1 if elem == item }
    elsif block_given?
      my_each { |elem| count += 1 if yield(elem) }
    else
      count = length
    end
    count
  end

  #8.  my_map
  def my_map
    block = nil
    new_array = []
    if block
      my_each_width_index do |elem, index|
        new_array[index] = block.call(elem)
      end
    else my_each_width_index do |elem, index|
           new_array[index] = yield(elem)
         end
    end
    new_array
  end

  #9. inject
  def my_inject
    result = self[0]
    my_each_width_index do |item, index|
      next if inde          index += 1
      endld(result, item)
     end
    result
   end

  end

#10. multiply_els
def multiply_els(array)
  array.my_inject { |product, elem| product * elem }
end


# The Test array that I use to test the methods below
ARRAY_SIZE = 100
LOWEST_VALUE = 0
HIGHEST_VALUE = 9
array = Array.new(ARRAY_SIZE) { rand(LOWEST_VALUE...HIGHEST_VALUE) }
block = proc { |num| num < (LOWEST_VALUE + HIGHEST_VALUE) / 2 }
words = %w[dog door rod blade]
range = Range.new(5, 50)
hash = { a: 1, b: 2, c: 3, d: 4, e: 5 }
numbers = [1, 2i, 3.14]
array_clone = array.clone


# 1. each
    #  hash.each {|item| print item}
    # array_clone.my_each {|item| print item}

# 2. each_with_index
  # range.each_with_index {|item,i| puts "Index: #{i} Item: #{item}"}
  # range.my_each_width_index {|item,i| puts "Index: #{i} Item: #{item}"}

# 3. select
  # print array_clone.select {|item| item.even? }
  # print array_clone.my_select {|item| item.even? }

# 4. all?
# puts range.all? {|item| item.is_a? Integer}
# puts range.all? {|item| item.is_a? String}
# puts range.my_all? {|item| item.is_a? Integer}
# puts range.my_all? {|item| item.is_a? String}

# 5. any?
# puts range.any? {|item| item.is_a? Integer}
# puts range.any? {|item| item.is_a? String}
# puts range.my_any? {|item| item.is_a? Integer}
# puts range.my_any? {|item| item.is_a? String}

# 6. none?
puts numbers.none? {|item| item.is_a? String}
puts numbers.none? {|item| item.is_a? Integer}
puts numbers.my_none? {|item| item.is_a? String}
puts numbers.my_none? {|item| item.is_a? Integer}

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
