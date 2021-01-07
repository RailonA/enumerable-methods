module Enumerable
  # 1. each
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
    yield(keys.zip(values)) if is_a?(Hash)
  end

  # 2. my_each_with_index
  def my_each_with_index
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

  # 3. my_select
  def my_select
    return to_enum unless block_given?

    new_array = []
    my_each do |item|
      new_array.push(item) if yield(item)
    end
    new_array
  end

  # 4. my_all?
  def my_all?
    return to_enum unless block_given?
    return false if nil?

    my_each do |item|
      return false unless yield(item)
    end
    true
  end

  #  5. my_any?
  def my_any?(&block)
    my_select(&block).length.positive?
  end

  #  6. My_none
  def my_none?(&block)
    my_select(&block).length.zero?
  end

  # 7. my_count
  def my_count(param = nil)
    counter = 0
    return to_a.length if !block_given? && param.nil?

    if block_given?
      my_each { |item| counter += 1 if yield(item) }
    else
      my_each { |item| counter += 1 if param == item }
    end
    counter
  end

  # #8.  my_map
  def my_map
    new_array = []
    return to_enum unless block_given?

    my_each { |index| new_array << yield(index) }
    new_array
  end

  # 9. inject
  def my_inject(item = nil)
    next_num = to_enum
    sum = item.nil? ? next_num.next : item

    if block_given?
      loop do
        sum = yield(sum, next_num.next)
      end
      # else
      #   raise LocalJumpError, 'no block given'
    end
    sum
  end
end

# 10. multiply_els
def multiply_els(array)
  array.my_inject { |product, elem| product * elem }
end

# The Test array that I use to test the methods below
# ARRAY_SIZE = 100
# LOWEST_VALUE = 0
# HIGHEST_VALUE = 9
# array = Array.new(ARRAY_SIZE) { rand(LOWEST_VALUE...HIGHEST_VALUE) }
# block = proc { |num| num < (LOWEST_VALUE + HIGHEST_VALUE) / 2 }
# words = %w[dog door rod blade]
# range = Range.new(5, 50)
# hash = { a: 1, b: 2, c: 3, d: 4, e: 5 }
# numbers = [1, 2i, 3.14]
# array_clone = array.clone

# 1. each
# hash.each {|item| print item}
#  hash.my_each {|item| print item}

# 2. each_with_index
# range.each_with_index {|item,i| puts "Index: #{i} Item: #{item}"}
# range.my_each_with_index {|item,i| puts "Index: #{i} Item: #{item}"}

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
# puts numbers.none? {|item| item.is_a? String}
# puts numbers.none? {|item| item.is_a? Integer}
# puts numbers.my_none? {|item| item.is_a? String}
# puts numbers.my_none? {|item| item.is_a? Integer}

# 7. count
#  puts array_clone.count {|item| item < 4}
#  puts array_clone.count(5)
#  puts array_clone.count
#  puts array_clone.my_count {|item| item < 4}
#  puts array_clone.my_count(5)
#  puts array_clone.my_count

# 8. map
# test_block = Proc.new {|elem| elem * 2}
#  print hash.map {|item| item * 2 }
# print test_array.map(&test_block)
#  print hash.my_map {|item| item * 2 }
# print test_array.my_map(&test_block)

# 9. inject
# puts hash.inject {|result,elem| result + elem}
# puts array.my_inject { |result, elem| result + elem }

# 10.  multiply_els
# puts multiply_els((5..10))
