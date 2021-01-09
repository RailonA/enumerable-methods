module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    size.times do |i|
      yield to_a[i]
    end
    self
  end

  def my_each_with_index
    return to_enum(:my_each) unless block_given?

    size.times do |i|
      yield to_a[i], i
    end
    self
  end

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

  def my_none?(arg = nil)
    if arg.nil?
      if block_given?
        my_each do |item|
          return false if yield(item)
        end
      else
        my_each do |item|
          return false if item
        end
      end
    elsif arg.is_a?(Regexp)
      my_each do |item|
        return false if item.match(arg)
      end
    elsif arg.is_a?(Module)
      my_each do |item|
        return false if item.is_a?(arg)
      end
    else
      my_each do |item|
        return false if item == arg
      end
    end
    true
  end

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

  def my_map(arg = nil)
    return to_enum :my_map unless block_given?

    return_arr = []
    if block_given? && arg.is_a?(Proc)
      my_each do |index|
        return_arr.push(arg.call(index))
      end
    elsif !block_given? && arg.is_a?(Proc)
      my_each do |index|
        return_arr.push(arg.call(index))
      end
    else
      my_each do |index|
        return_arr.push(yield(index))
      end
    end
    return_arr
  end

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

def multiply_els(array)
  array.my_inject { |product, elem| product * elem }
end
