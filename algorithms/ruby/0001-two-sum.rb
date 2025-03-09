# frozen_string_literal: true

# 1. Two Sum
# https://leetcode.com/problems/two-sum

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
# def two_sum(nums, target)
#     for i in 0...nums.length
#         for j in (i+1)...nums.length
#            if nums[i] + nums[j] == target
#                 return [i, j]
#             end
#         end
#     end
#
#     nil
# end

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
    hash = {}
    
    nums.each_with_index do |num, i|
      complement = target - num
      return [hash[complement], i] if hash.key?(complement)
      
      hash[num] = i
    end
    
    nil
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_two_sum < Test::Unit::TestCase
def test_
    assert_equal [0, 1].sort, two_sum([2, 7, 11, 15], 9).sort
    assert_equal [1, 2].sort, two_sum([3, 2, 4], 6).sort
    assert_equal [0, 1].sort, two_sum([3, 3], 6).sort
end
end