# frozen_string_literal: true

# 27. Remove Element
# https://leetcode.com/problems/remove-element/

# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}
def remove_element(nums, val)
  i = 0

  nums.each_with_index do |num, j|
    if num != val
      nums[i] = nums[j]
      i += 1
    end
  end

  i
end

# **************** #
#       TEST       #
# **************** #

require 'test/unit'
class TestRemoveElement < Test::Unit::TestCase
  def test_remove_element
    # Example 1: nums = [3,2,2,3], val = 3
    nums = [3, 2, 2, 3]
    val = 3
    k = remove_element(nums, val)
    assert_equal 2, k
    sorted_result = nums[0...k].sort
    assert_equal [2, 2], sorted_result

    # Example 2: nums = [0,1,2,2,3,0,4,2], val = 2
    nums = [0, 1, 2, 2, 3, 0, 4, 2]
    val = 2
    k = remove_element(nums, val)
    assert_equal 5, k
    sorted_result = nums[0...k].sort
    assert_equal [0, 0, 1, 3, 4], sorted_result

    # Additional test cases

    # Empty array
    nums = []
    val = 5
    k = remove_element(nums, val)
    assert_equal 0, k
    assert_equal [], nums[0...k]

    # Array with all elements equal to val
    nums = [7, 7, 7, 7]
    val = 7
    k = remove_element(nums, val)
    assert_equal 0, k
    assert_equal [], nums[0...k]

    # Array with no elements equal to val
    nums = [1, 2, 3, 4, 5]
    val = 0
    k = remove_element(nums, val)
    assert_equal 5, k
    sorted_result = nums[0...k].sort
    assert_equal [1, 2, 3, 4, 5], sorted_result

    # Array with single element equal to val
    nums = [5]
    val = 5
    k = remove_element(nums, val)
    assert_equal 0, k
    assert_equal [], nums[0...k]

    # Array with single element not equal to val
    nums = [10]
    val = 5
    k = remove_element(nums, val)
    assert_equal 1, k
    assert_equal [10], nums[0...k]
  end
end
