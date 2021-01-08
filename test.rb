require_relative 'enumerable'

ARRAY_SIZE = 100
LOWEST_VALUE = 0
HIGHEST_VALUE = 9
array = [1, 2, 3, 4, 5]
block = proc { |num| num < (LOWEST_VALUE + HIGHEST_VALUE) / 2 }
words = %w[dog door rod blade]
range = Range.new(5, 50)
hash = { a: 1, b: 2, c: 3, d: 4, e: 5 }
numbers = [1, 2i, 3.14]
array_clone = array.clone

puts '**************                                    **********************'
puts '**************                                    **********************'
puts '**************      THIS IS METHOD: my_each       **********************'
puts '**************                                    **********************'
puts '**************                                    **********************'

puts '**************** array.my_each *******************'
p array.my_each { |item| p item }
puts '**************** words.my_each *******************'
p words.my_each { |item| p item }
puts '**************** hash.my_each *******************'
p hash.my_each { |item| p item }
puts '**************** numbers.my_each *******************'
p numbers.my_each { |item| p item }
puts '**************** array_clone.my_each *******************'
p array_clone.my_each { |item| p item }

puts '**************                                    **********************'
puts '**************                                    **********************'
puts '************** THIS IS METHOD: my_each_with_index **********************'
puts '**************                                    **********************'
puts '**************                                    **********************'
puts '**************** array.my_each_with_index *******************'
p array.my_each_with_index { |item, i| puts "Index: #{i} Item: #{item}" }
puts '**************** words.my_each_with_index *******************'
p words.my_each_with_index { |item, i| puts "Index: #{i} Item: #{item}" }
puts '**************** hash.my_each_with_index *******************'
p hash.my_each_with_index { |item, i| puts "Index: #{i} Item: #{item}" }
puts '**************** numbers.my_each_with_index *******************'
p numbers.my_each_with_index { |item, i| puts "Index: #{i} Item: #{item}" }
puts '**************** array_clone.my_each_with_index *******************'
p array_clone.my_each_with_index { |item, i| puts "Index: #{i} Item: #{item}" }

puts '**************                                    **********************'
puts '**************                                    **********************'
puts '************** THIS IS METHOD: my_select **********************'
puts '**************                                    **********************'
puts '**************                                    **********************'
puts '**************** array.my_select *******************'
p array.my_select(&:even?)
puts '**************** range.my_select *******************'
p range.my_select(&:even?)
puts '**************** array_clone.my_select *******************'
p array_clone.my_select(&:even?)

puts '**************                                    **********************'
puts '**************                                    **********************'
puts '************** THIS IS METHOD: my_all **********************'
puts '**************                                    **********************'
puts '**************                                    **********************'
puts '**************** array.my_all (Integer/String) *******************'
p array.my_all? { |item| item.is_a? Integer }
p array.my_all? { |item| item.is_a? String }
p array.my_all?
puts '**************** range.my_all  (Integer/String) *******************'
p range.my_all? { |item| item.is_a? Integer }
p range.my_all? { |item| item.is_a? String }
p range.my_all?
puts '**************** array_clone.my_all  (Integer/String) *******************'
p array_clone.my_all? { |item| item.is_a? Integer }
p array_clone.my_all? { |item| item.is_a? String }
p array_clone.my_all?
puts '**************** words.my_all  (Integer/String) *******************'
p words.my_all? { |item| item.is_a? Integer }
p words.my_all? { |item| item.is_a? String }
p words.my_all?

puts '**************                                    **********************'
puts '**************                                    **********************'
puts '************** THIS IS METHOD: my_any? **********************'
puts '**************                                    **********************'
puts '**************                                    **********************'
puts '**************** array.my_any?  (Integer/String) *******************'
p array.my_any? { |item| item.is_a? Integer }
p array.my_any? { |item| item.is_a? String }
puts '**************** words.my_any?  (Integer/String) *******************'
p words.my_any? { |item| item.is_a? Integer }
p words.my_any? { |item| item.is_a? String }

puts '**************                                    **********************'
puts '**************                                    **********************'
puts '************** THIS IS METHOD: my_none? **********************'
puts '**************                                    **********************'
puts '**************                                    **********************'
puts '**************** array.my_none? (Integer/String) *******************'
p array.my_none? { |item| item.is_a? Integer }
p array.my_none? { |item| item.is_a? String }
puts '**************** range.my_none?  (Integer/String) *******************'
p range.my_none? { |item| item.is_a? Integer }
p range.my_none? { |item| item.is_a? String }
puts '**************** array_clone.my_none?  (Integer/String) *******************'
p array_clone.my_none? { |item| item.is_a? Integer }
p array_clone.my_none? { |item| item.is_a? String }
puts '**************** words.my_none?  (Integer/String) *******************'
p words.my_none? { |item| item.is_a? Integer }
p words.my_none? { |item| item.is_a? String }

puts '**************                                    **********************'
puts '**************                                    **********************'
puts '************** THIS IS METHOD: my_count? **********************'
puts '**************                                    **********************'
puts '**************                                    **********************'
puts '**************** array.my_count? *******************'
p array.my_count { |item| item < 4 }
p array.my_count(5)
p array.my_count
puts '**************** range.my_count? *******************'
p range.my_count { |item| item < 4 }
p range.my_count(5)
p range.my_count
puts '**************** array_clone.my_count? *******************'
p array_clone.my_count { |item| item < 4 }
p array_clone.my_count(5)
p array_clone.my_count

puts '**************                                    **********************'
puts '**************                                    **********************'
puts '************** THIS IS METHOD: my_map **********************'
puts '**************                                    **********************'
puts '**************                                    **********************'
puts '**************** array.my_map *******************'
p array.my_map { |item| item * 2 }
puts '**************** hash.my_map *******************'
p hash.my_map { |item| item * 2 }
puts '**************** numbers.my_map *******************'
p numbers.my_map { |item| item * 2 }
puts '**************** words.my_map *******************'
p words.my_map { |item| item * 2 }

puts '**************                                    **********************'
puts '**************                                    **********************'
puts '************** THIS IS METHOD: my_inject **********************'
puts '**************                                    **********************'
puts '**************                                    **********************'
puts '**************** array.my_inject **********************'
p array.my_inject { |result, elem| result + elem }
puts '**************** hash.my_inject **********************'
p hash.my_inject { |result, elem| result + elem }
puts '**************** numbers.my_inject **********************'
p numbers.my_inject { |result, elem| result + elem }
puts '**************** range.my_inject **********************'
p range.my_inject { |result, elem| result + elem }
puts '**************** array_clone.my_inject **********************'
p array_clone.my_inject { |result, elem| result + elem }

puts '**************                                    **********************'
puts '**************                                    **********************'
puts '************** THIS IS METHOD: multiply_els **********************'
puts '**************                                    **********************'
puts '**************                                    **********************'
p multiply_els((5..10))
