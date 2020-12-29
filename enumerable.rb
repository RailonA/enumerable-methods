

module Enumerable
  #each
  def my_each
    self_length = self.length
     self_length.times do |index|
      yield(self[index])
    end
  end

  # my_each_width_index
  def my_each_width_index
      self_length = self.length
      self_length.times do |index|
        yield(self[index], index)
      end
  end

  # my_select
  def my_select
    new_array = Array.new
    self.my_each do |item|
      if yield(item)
        new_array.push(item)
      end
    end
    new_array
  end

  # my_all?
  def my_all?
    return false if self.empty?
    self.my_each do |item|
     unless yield(item)
      return false 
      end
    end
    true
  end

    # my_any?
    def my_any?
      return false if self.empty?
      self.my_each do |item|
       unless yield(item)
        return false 
        end
      end
      true
    end
  
    # my_none?
    def my_none?
      return false if self.empty?
      self.my_each do |item|
       if yield(item)
        return false 
        end
      end
      true
    end
      
  
end
  
  
  test_arr = [100,54,1,2,3,4]
  
# each
# test_arr.each {|item| puts item*2}
# test_arr.my_each {|item| puts item*2}
  
# each_with_index
# test_arr.each_with_index {|item,i| puts "Index: #{i} Item: #{item}"}
# test_arr.my_each_width_index {|item,i| puts "Index: #{i} Item: #{item}"}
  
# select
# print test_arr.select {|item| item.even? }
# print test_arr.my_select {|item| item.even? }
  
# all?
# print test_arr.all? {|item| item.is_a? Integer}
# print test_arr.all? {|num| item.is_a? String}
# print test_arr.my_all? {|item| item.is_a? Integer}
# print test_arr.my_all? {|item| item.is_a? String}

# any?
# print test_arr.any? {|item| item.is_a? Integer}
# print test_arr.any? {|item| item.is_a? String}
# print test_arr.my_any? {|item| item.is_a? Integer}
# print test_arr.my_any? {|item| item.is_a? String}
  
# none?
# print test_arr.none? {|item| item.is_a? String}
# print test_arr.none? {|item| item.is_a? Integer}
# print test_arr.my_none? {|item| item.is_a? String}
# print test_arr.my_none? {|item| item.is_a? Integer}


 
