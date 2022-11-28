def first_thing(array)
	array.first
end

# O(1)


##############################################

def three_hundred_thousand_picks(name)
	300000.times { puts "hello, #{name}" }
end

# O(1)


##############################################

def print_all(array)
	array.each { |el| puts el }
end

# O(n)


##############################################


def most_common_char(word)
	counts = Hash.new(0) # 1 operation
	word.chars.each { |char| counts[char] += 1 } # O(n) operations
	counts.max_by { |_, num| num } #O(n) operations (iterating over our hash)
end

# 2n + 1 -> O(n)

##############################################

class Array
  def include?(value)
    self.each do |el|
      return true if (el == value)
    end

    false
  end
end


def bsearch(nums, target, start = 0, finish = nums.length)
  return nil if start == finish

  mid = (finish - start) / 2 + start
  case target <=> nums[mid]
  when -1
    bsearch(nums, target, start, mid)
  when 0
    mid
  when 1
    bsearch(nums, target, mid+1, finish)
  end
end

# O(log n)
# no n component cause you're not looking at entire array each time


class Array
  def merge_sort # O(log n)
    return self if count < 2

    middle = count / 2

    left, right = self.take(middle), self.drop(middle)
    sorted_left sorted_right = left.merge)sort, right.merge_sort

    self.class.merge(sorted_left, sorted_right)
  end

  def self.merge(left, right) # O(n)
    merged_array = []
    until left.empty? || right.empty?
      merged_array << ( (left.first < right.first) ? left.shift : right.shift )
    end

    merged_array + left + right
  end
end
  # O (n log n)


def all_pair_sums
  sums = []

  array.each do |el1|
    array.each do |el2|
      sums << el1 + el2
    end
  end

  sums
end

# n * n => O(n^2)


class Array
  def subsets
    return [[]] if empty?
    subs_without_first = drop(1).subsets
    subs_with_first = subs_without_first.map { |subs| [first] + sub }
    subs_with_first + subs_without_first
  end
end

# O(2^n)


def permutations(array)
  return [array] if array.length <= 1

  perms_without_first.inject([]) do |all_perms, perm|
    all_perms + (0..perm.size).map do |i|
      perm.take(i) + [array.first] + perm.drop(i)
    end
  end
end

# O(n!)


# Some notes on space complexity
# - Refers to additional memory used (new data structures)
# - We can also use Big-O notation
#   - Describes how much additional space is needed with respect to n
# - Space is in the form of RAM and it's relatively abundant

# When it matters
# - Interviews (very very important)
# - Building large scalable applications
# - Building apps for limited hardware
# - Fixing bottlenecks in performance


# 9 times out of 10, readable code is much more important that efficient code
# If you optimize 100% of your code, you're wasting 90% of your time"


