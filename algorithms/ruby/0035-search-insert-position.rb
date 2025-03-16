# frozen_string_literal: true

# 35. Search Insert Position
# https://leetcode.com/problems/search-insert-position/

# Given a sorted array of distinct integers and a target value, return the index if the target is found.
# If not, return the index where it would be if it were inserted in order.
# You must write an algorithm with O(log n) runtime complexity.

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
# def search_insert(nums, target)
#   return 0 if nums.empty? || target <= nums[0]
#   return nums.length - 1 if nums[-1] == target
#   return nums.length if target > nums[-1]
#   return 1 if nums.length == 2 && (nums[0] < target && target < nums[1])
#
#   (1...nums.length).each do |i|
#     return i if nums[i] == target
#     return i if nums[i - 1] < target && target < nums[i]
#   end
#
#   0
# end

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
# def search_insert(nums, target)
#   nums.each_with_index do |num, index|
#     return index if num >= target
#   end
#   nums.length
# end

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
  nums.index { _1 >= target } || nums.length
end

# **************** #
#       TEST       #
# **************** #

require 'test/unit'

class TestSearchInsert < Test::Unit::TestCase
  def test_search_insert
    # Example 1
    assert_equal(2, search_insert([1, 3, 5, 6], 5), 'Example 1: target found in array')

    # Example 2
    assert_equal(1, search_insert([1, 3, 5, 6], 2), 'Example 2: target not found, should be inserted at index 1')

    # Example 3
    assert_equal(4, search_insert([1, 3, 5, 6], 7), 'Example 3: target not found, should be inserted at the end')

    # Additional test cases
    assert_equal(0, search_insert([1, 3, 5, 6], 0), 'Target smaller than all elements')
    assert_equal(0, search_insert([], 5), 'Empty array')
    assert_equal(0, search_insert([3], 1), 'Single element array, target smaller')
    assert_equal(1, search_insert([3], 5), 'Single element array, target larger')
    assert_equal(0, search_insert([3], 3), 'Single element array, target equal')
    assert_equal(1, search_insert([1, 3], 2), 'Target 2 in array [1,3], should be inserted at index 1')
  end
end
