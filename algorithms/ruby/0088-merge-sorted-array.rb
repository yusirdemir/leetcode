# frozen_string_literal: true

# 88. Merge Sorted Array
# https://leetcode.com/problems/merge-sorted-array/

# @param {Integer[]} nums1
# @param {Integer} m
# @param {Integer[]} nums2
# @param {Integer} n
# @return {Void} Do not return anything, modify nums1 in-place instead.
# def merge(nums1, m, nums2, n)
#  k = m + n - 1
#  i = m - 1
#  j = n - 1
#
#  while j >= 0
#      if i >= 0 && nums1[i] > nums2[j]
#          nums1[k] = nums1[i]
#          i -= 1
#      else
#          nums1[k] = nums2[j]
#          j -= 1
#      end
#      k -= 1
#  end
# end

# @param {Integer[]} nums1
# @param {Integer} m
# @param {Integer[]} nums2
# @param {Integer} n
# @return {Void} Do not return anything, modify nums1 in-place instead.
def merge(nums1, m, nums2, n)
    n.times do |j|
      nums1[m + j] = nums2[j]
  end
  nums1.sort!
end

# **************** #
#       TEST       #
# **************** #

require 'test/unit'

class TestMergeSortedArray < Test::Unit::TestCase
  def test_merge
    # Test Case 1: Standard merge
    nums1 = [1, 2, 3, 0, 0, 0]
    merge(nums1, 3, [2, 5, 6], 3)
    assert_equal [1, 2, 2, 3, 5, 6], nums1

    # Test Case 2: One array empty
    nums1 = [1]
    merge(nums1, 1, [], 0)
    assert_equal [1], nums1

    # Test Case 3: First array empty
    nums1 = [0]
    merge(nums1, 0, [1], 1)
    assert_equal [1], nums1

    # Test Case 4: Handle duplicates
    nums1 = [1, 2, 3, 0, 0, 0]
    merge(nums1, 3, [1, 2, 3], 3)
    assert_equal [1, 1, 2, 2, 3, 3], nums1

    # Test Case 5: Larger array
    nums1 = [1, 3, 5, 7, 9, 0, 0, 0, 0, 0]
    merge(nums1, 5, [2, 4, 6, 8, 10], 5)
    assert_equal [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], nums1

    # Test Case 6: Negative numbers
    nums1 = [-3, -1, 0, 0, 0]
    merge(nums1, 2, [-2, 5, 6], 3)
    assert_equal [-3, -2, -1, 5, 6], nums1
  end
end
