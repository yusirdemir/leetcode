# frozen_string_literal: true

# 69. Sqrt(x)
# https://leetcode.com/problems/sqrtx/

# @param {Integer} x
# @return {Integer}
# def my_sqrt(x)
#   Math.sqrt(x).to_i
# end

# @param {Integer} x
# @return {Integer}
# def my_sqrt(x)
#   return 0 if x.zero?
#   return 1 if x == 1
#
#   i = 1
#   while i * i <= x
#     i += 1
#   end
#
#   i - 1
# end

# @param {Integer} x
# @return {Integer}
def my_sqrt(x)
  return 0 if x.zero?
  return 1 if x == 1

  left = 1
  right = x

  while left <= right
    mid = left + ((right - left) / 2)

    if mid <= x / mid && (mid + 1) > x / (mid + 1)
      return mid
    elsif mid > x / mid
      right = mid - 1
    else
      left = mid + 1
    end
  end

  right
end

# **************** #
#       TEST       #
# **************** #

require 'test/unit'

class TestMySqrt < Test::Unit::TestCase
  def test_my_sqrt
    assert_equal 2, my_sqrt(4)
    assert_equal 2, my_sqrt(8)
    assert_equal 3, my_sqrt(9)
    assert_equal 3, my_sqrt(10)
    assert_equal 10, my_sqrt(100)
    assert_equal 46_340, my_sqrt(2_147_483_647) # 2^31 - 1
    assert_equal 0, my_sqrt(0)
    assert_equal 1, my_sqrt(1)
  end
end
