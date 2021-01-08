require_relative 'enumerable.rb'

my_array = [1, 2, 3, 4, 5]
my_hash = { x: 1, y: 2, z: 3 }
my_text = %w[ant bear cat]
arg = proc { |value| value * 2 }

puts '==========================this is my each method'
p my_array.my_each
p(my_hash.my_each { |value| p value })
p((1..10).my_each { |value| p value })
# puts '==========================this is  each method'
# p my_array.each
# p my_hash.each { |value| p value }
# p (1..10).each { |value| p value }

puts '==========================this is my_each_with_index method'
p(my_array.my_each_with_index { |value, i| puts value, i })
p(my_hash.my_each_with_index { |value, i| p value, i })
p((1..10).my_each_with_index { |value, i| p value, i })
# puts '==========================this is each_with_index method'
# p my_array.each_with_index { |value, i| puts value, i }
# p my_hash.each_with_index { |value, i| p value, i }
# p (1..10).each_with_index { |value, i| p value, i }

puts '==========================this is my_select method'
p(my_array.my_select { |value| value > 3 })
p(my_hash.my_select { |_key, value| value > 1 })
p((1..10).my_select { |value| value > 6 })
# puts '==========================this is select method'
# p my_array.select { |value| value > 3 }
# p my_hash.select { |_key, value| value > 1 }
# p(1..10).select { |value| value > 6 }

puts '==========================this is my_all? method'
p(my_text.my_all?(/t/))
p(my_array.my_all?(Numeric))
p(my_array.my_all?)
p(my_array.my_all? { |value| value >= 2 })
p(my_text.my_all?(/t/) { |value| value >= 2 })
# puts '==========================this is all? method'
# p my_text.my_all?(/t/)
# p my_array.my_all?(Numeric)
# p my_array.my_all?
# p my_array.my_all? { |value| value >= 2 }
# p my_text.my_all?(/t/) { |value| value >= 2 }

puts '==========================this is my_any method'
p(my_text.my_any?(/t/))
p(my_array.my_any?(Numeric))
p(my_array.my_any?)
p(my_array.my_any? { |value| value > 10 })
p(my_text.my_any?(/t/) { |value| value >= 2 })
# puts '==========================this is any method'
# p my_text.any?(/t/)
# p my_array.any?(Numeric)
# p my_array.any?
# p my_array.any? { |value| value > 10 }
# p my_text.any?(/t/) { |value| value >= 2 }

puts '==========================this is my_none? method'
p(%w[ant bear cat].my_none? { |word| word.length == 5 })
p(%w[ant bear cat].my_none? { |word| word.length >= 4 })
p(%w[ant bear cat].my_none?(/d/))
p([1, 3.14, 42].my_none?(Float))
p([].my_none?)
p([nil].my_none?)
p([nil, false].my_none?)
p([nil, false, true].my_none?)
# puts '==========================this is none? method'
# p %w[ant bear cat].none? { |word| word.length == 5 }
# p %w[ant bear cat].none? { |word| word.length >= 4 }
# p %w[ant bear cat].none?(/d/)
# p [1, 3.14, 42].none?(Float)
# p [].none?
# p [nil].none?
# p [nil, false].none?
# p [nil, false, true].none?

puts '==========================this is my_map method'
p(my_array.my_map { |value| value * 2 })
p((1..4).my_map { |i| i * i })
p(my_array.my_map(&arg))
# puts '==========================this is map method'
# p my_array.map { |value| value * 2 }
# p (1..4).map { |i| i * i }
# p my_array.map(&arg)

puts '==========================this is my_count method'
p(my_array.my_count)
p(my_array.my_count(2))
p(my_array.my_count { |x| (x % 2).zero? })
p(my_array.my_count(2) { |value| value })
p((1..10).my_count { |x| (x % 2).zero? })
# puts '==========================this is count method'
# p my_array.count
# p my_array.count(2)
# p my_array.count { |x| (x % 2).zero? }
# p my_array.count(2) { |value| value }
# p (1..10).count { |x| (x % 2).zero? }

puts '==========================this is my_inject method'
p(my_array.my_inject { |value| value * 2 })
p((5..10).my_inject { |sum, n| sum + n })
p((5..10).my_inject(1, :*))
p((5..10).my_inject(1) { |product, n| product * n })
longest = %w[cat mouse sheep bear banana].my_inject do |memo, word|
  memo.length > word.length ? memo : word
end
p longest
p my_array

puts '==========================this is multiply_els method'
p multiply_els((my_array))