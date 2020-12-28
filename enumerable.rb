

module Enumerable
  #each
  def my_each
    self_length = self.length
     self_length.times do |index|
      yield(self[index])
      print index += 1
    end
  end
  
end
  
  
  test_arr = [100,54,1,2,3,4]
  
#each
  test_arr.each {|item| puts item*2}
  test_arr.my_each {|item| puts item*2}
  
  
 
