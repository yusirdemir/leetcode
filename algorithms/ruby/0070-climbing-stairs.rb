# frozen_string_literal: true

# 70. Climbing Stairs
# https://leetcode.com/problems/climbing-stairs/

# @param {Integer} n
# @return {Integer}
# def climb_stairs(n)
#   return 1 if n == 1
#   return 2 if n == 2
#
#   a, b = 1, 2
#   (n - 2).times do
#     a, b = b, a + b
#   end
#
#   b
# end

# @param {Integer} n
# @return {Integer}
# def climb_stairs(n)
#   memo = {}
#   memo[1] = 1
#   memo[2] = 2
#
#   (3..n).each do |i|
#     memo[i] = memo[i - 1] + memo[i - 2]
#   end
#
#   memo[n]
# end

# @param {Integer} n
# @return {Integer}
def climb_stairs(n, memo = {})
  return 1 if n == 1
  return 2 if n == 2
  return memo[n] if memo[n]
  
  memo[n] = climb_stairs(n - 1, memo) + climb_stairs(n - 2, memo)
end

# **************** #
#       TEST       #
# **************** #

require 'test/unit'

class TestClimbStairs < Test::Unit::TestCase
  def test_climb_stairs
    assert_equal 1, climb_stairs(1)
    assert_equal 2, climb_stairs(2)
    assert_equal 3, climb_stairs(3)
    assert_equal 5, climb_stairs(4)
    assert_equal 8, climb_stairs(5)
    assert_equal 13, climb_stairs(6)
    assert_equal 89, climb_stairs(10)
    assert_equal 1134903170, climb_stairs(45) # Max constraint
  end
end 