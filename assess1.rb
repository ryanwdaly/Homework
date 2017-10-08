require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  #add proc to parameters
  def my_inject(accumulator = nil, &block)
    i = 0
    if accumulator.nil?
      accumulator = self.first
      i += 1
    end

    while i < self.length
      accumulator = block.call(accumulator,self[i])

      i += 1
    end
    accumulator
  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  i = 2

  while i < num
    return false if i % num == 0
  end
  true
end

def primes(num)
  result = []

  i = 1

  while result < num
    result << i if i.is_prime?
    i += 1
  end
  result
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  if num == 1
    [1]
  else
    factorials = factorials_rec(num)
    factorials << factorials.last * (num - 1)
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    result = Hash.new(0)
    self.each.with_index do |num, idx|
      result[num] += idx
    end

    result.select { |k,v| v.length > 1}
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
  end

  private
  def self.merge(left, right, &prc)
  end
end
