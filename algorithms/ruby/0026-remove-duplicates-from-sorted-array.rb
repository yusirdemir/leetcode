# frozen_string_literal: true

# 26. Remove Duplicates from Sorted Array
# https://leetcode.com/problems/remove-duplicates-from-sorted-array/

# @param {Integer[]} nums
# @return {Integer}
# def remove_duplicates(nums)
#   nums.uniq!
#   nums.length
# end

# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  return 0 if nums.empty?

  i = 0
  (1...nums.length).each do |j|
    next if nums[j] == nums[i]

    i += 1
    nums[i] = nums[j]
  end
  i + 1
end

# **************** #
#       TEST       #
# **************** #

require 'test/unit'
class TestRemoveDuplicatesFromSortedArray < Test::Unit::TestCase
  def test_remove_duplicates
    # Example 1: nums = [1,1,2]
    nums = [1, 1, 2]
    k = remove_duplicates(nums)
    assert_equal 2, k
    assert_equal [1, 2], nums[0...k]

    # Example 2: nums = [0,0,1,1,1,2,2,3,3,4]
    nums = [0, 0, 1, 1, 1, 2, 2, 3, 3, 4]
    k = remove_duplicates(nums)
    assert_equal 5, k
    assert_equal [0, 1, 2, 3, 4], nums[0...k]

    # Additional test cases

    # Empty array
    nums = []
    k = remove_duplicates(nums)
    assert_equal 0, k
    assert_equal [], nums[0...k]

    # Array with single element
    nums = [5]
    k = remove_duplicates(nums)
    assert_equal 1, k
    assert_equal [5], nums[0...k]

    # Array with all duplicates
    nums = [3, 3, 3, 3, 3]
    k = remove_duplicates(nums)
    assert_equal 1, k
    assert_equal [3], nums[0...k]

    # Array with no duplicates
    nums = [1, 2, 3, 4, 5]
    k = remove_duplicates(nums)
    assert_equal 5, k
    assert_equal [1, 2, 3, 4, 5], nums[0...k]

    # Array with negative numbers
    nums = [-3, -3, -2, -1, -1, 0, 0]
    k = remove_duplicates(nums)
    assert_equal 4, k
    assert_equal [-3, -2, -1, 0], nums[0...k]
  end
end
