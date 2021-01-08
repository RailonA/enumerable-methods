module Enumerable
  # 1. each
  def my_each
    return to_enum(:my_each) unless block_given?

    size.times do |i|
      yield to_a[i]
    end
    self
  end

  # 2. my_each_with_index
  def my_each_with_index
    return to_enum(:my_each) unless block_given?

    index = 0
    value = 0
    while index < size
      if is_a?(Array)
        yield(self[index], index)
      elsif is_a?(Range)
        yield(to_a[index], index)
      end
      index += 1
      while value < size
        yield(keys[value], values[value]) if is_a?(Hash)
        value += 1
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
  def my_none?(arg = nil)
    return true if block_given? && !arg.nil? && my_none?(arg) && my_none?

    if block_given?
      my_each { |item| return false if yield(item) }
    elsif arg.nil?
      my_each { |item| return false if item }
    elsif arg.instance_of?(Class)
      my_each do |item|
        return false if item.class <= arg
      end
    elsif arg.instance_of?(Regexp)
      my_each { |item| return false if item =~ arg }
    else
      my_each { |item| return false if item == arg && item.class <= arg.class }
    end
    true
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
    end
    sum
  end
end

# 10. multiply_els
def multiply_els(array)
  array.my_inject { |product, elem| product * elem }
end
