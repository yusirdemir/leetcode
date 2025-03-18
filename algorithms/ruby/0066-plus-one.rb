# frozen_string_literal: true

# 66. Plus One
# https://leetcode.com/problems/plus-one/

# @param {Integer[]} digits
# @return {Integer[]}
# def plus_one(digits)
#   (digits.join.to_i + 1).to_s.chars.map(&:to_i)
# end

# @param {Integer[]} digits
# @return {Integer[]}
# def plus_one(digits)
#     digits.join.to_i.next.digits.reverse
# end

# @param {Integer[]} digits
# @return {Integer[]}
# def plus_one(digits)
#   carryover = 1
#   pointer = -1
#
#   while carryover.positive?
#     break digits.unshift(carryover) if digits[pointer].nil?
#
#     sum = digits[pointer] + carryover
#     carryover = sum / 10
#     digits[pointer] = sum % 10
#     pointer -= 1
#   end
#
#   digits
# end

# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits, pointer = -1, carryover = 1)
  return digits if carryover.zero?
  return digits.unshift(carryover) if digits[pointer].nil?

  sum = digits[pointer] + carryover
  digits[pointer] = sum % 10

  plus_one(digits, pointer - 1, sum / 10)
end

# **************** #
#       TEST       #
# **************** #

require 'test/unit'

class TestPlusOne < Test::Unit::TestCase
  def test_plus_one
    assert_equal [1, 2, 4], plus_one([1, 2, 3])
    assert_equal [4, 3, 2, 2], plus_one([4, 3, 2, 1])
    assert_equal [1, 0], plus_one([9])
    assert_equal [1, 0, 0], plus_one([9, 9])
    assert_equal [1, 0, 0, 0], plus_one([9, 9, 9])
    assert_equal [1], plus_one([0])
    assert_equal [2, 0], plus_one([1, 9])
  end
end
