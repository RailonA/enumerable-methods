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

    size.times do |i|
      yield to_a[i], i
    end
    self
  end

  # 3. my_select
  def my_select
    return to_enum :my_select unless block_given?

    return_arr = []
    return_hash = {}
    if is_a?(Hash)
      my_each do |key, val|
        return_hash[key] = val if yield(key, val)
      end
      return_hash
    else
      my_each do |val|
        return_arr.push(val) if yield(val)
      end
      return_arr
    end
  end

  # 4. my_all?
  def my_all?(arg = nil)
    if arg.nil?
      if block_given?
        my_each do |item|
          return false unless yield(item)
        end
      else
        my_each do |item|
          return false unless item
        end
      end
    elsif arg.is_a?(Regexp)
      my_each do |item|
        return false unless item.match(arg)
      end
    elsif arg.is_a?(Module)
      my_each do |item|
        return false unless item.is_a?(arg)
      end
    else
      my_each do |item|
        return false unless item == arg
      end
    end
    true
  end

  #  5. my_any?
  def my_any?(arg = nil)
    if arg.nil?
      if block_given?
        my_each do |item|
          return true if yield(item)
        end
      else
        my_each do |item|
          return true if item
        end
      end
    elsif arg.is_a?(Regexp)
      my_each do |item|
        return true if item.match(arg)
      end
    elsif arg.is_a?(Module)
      my_each do |item|
        return true if item.is_a?(arg)
      end
    else
      my_each do |item|
        return true if item == arg
      end
    end
    false
  end

  #  6. My_none
  def my_none?(arg = nil)
    if arg.nil?
      if block_given?
        my_each do |item|
          return true if yield(item)
        end
      else
        my_each do |item|
          return true if item
        end
      end
    elsif arg.is_a?(Regexp)
      my_each do |item|
        return true if item.match(arg)
      end
    elsif arg.is_a?(Module)
      my_each do |item|
        return true if item.is_a?(arg)
      end
    else
      my_each do |item|
        return true if item == arg
      end
    end
    true
  end

  # 7. my_count
  def my_count(arg = nil)
    ans = 0
    if block_given?
      my_each do |item|
        ans += 1 if yield(item)
      end
    elsif arg.nil?
      ans = size
    else
      my_each do |item|
        ans += 1 if item == arg
      end
    end
    ans
  end

  # #8.  my_map
  def my_map
    new_array = []
    return to_enum unless block_given?

    my_each { |index| new_array << yield(index) }
    new_array
  end

  # 9. inject
  def my_inject(*arg)
    raise LocalJumpError unless block_given? || !arg.empty?

    sym = arg.pop unless block_given?
    my_array = arg + to_a
    memo = my_array.shift
    if block_given?
      my_array.my_each { |item| memo = yield(memo, item) }
    else
      my_array.my_each { |item| memo = memo.send(sym, item) }
    end
    memo
  end


end

# 10. multiply_els
def multiply_els(array)
  array.my_inject { |product, elem| product * elem }
end

