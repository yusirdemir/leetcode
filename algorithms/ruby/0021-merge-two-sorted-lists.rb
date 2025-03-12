# frozen_string_literal: true

# 21. Merge Two Sorted Lists
# https://leetcode.com/problems/merge-two-sorted-lists/

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# @param {ListNode} list1
# @param {ListNode} list2
# @return {ListNode}
# def merge_two_lists(list1, list2)
#   return list2 if list1.nil?
#   return list1 if list2.nil?
#
#   dummy = ListNode.new(0)
#   current = dummy
#
#   while list1 && list2
#     if list1.val <= list2.val
#       current.next = list1
#       list1 = list1.next
#     else
#       current.next = list2
#       list2 = list2.next
#     end
#     current = current.next
#   end
#
#   current.next = list1 || list2
#
#   dummy.next
# end

# @param {ListNode} list1
# @param {ListNode} list2
# @return {ListNode}
def merge_two_lists(list1, list2)
  return list2 if list1.nil?
  return list1 if list2.nil?

  if list1.val <= list2.val
    list1.next = merge_two_lists(list1.next, list2)
    list1
  else
    list2.next = merge_two_lists(list1, list2.next)
    list2
  end
end

# **************** #
#       TEST       #
# **************** #

require 'test/unit'
class TestMergeTwoSortedLists < Test::Unit::TestCase
  def test_merge_two_lists
    # Test Case 1: Lists [1,2,4] and [1,3,4]
    # Create list1 = [1,2,4]
    list1 = ListNode.new(1)
    list1.next = ListNode.new(2)
    list1.next.next = ListNode.new(4)

    # Create list2 = [1,3,4]
    list2 = ListNode.new(1)
    list2.next = ListNode.new(3)
    list2.next.next = ListNode.new(4)

    # Merge
    merged = merge_two_lists(list1, list2)

    # Check result: [1,1,2,3,4,4]
    assert_equal 1, merged.val
    assert_equal 1, merged.next.val
    assert_equal 2, merged.next.next.val
    assert_equal 3, merged.next.next.next.val
    assert_equal 4, merged.next.next.next.next.val
    assert_equal 4, merged.next.next.next.next.next.val
    assert_nil merged.next.next.next.next.next.next

    # Test Case 2: Two empty lists
    merged = merge_two_lists(nil, nil)
    assert_nil merged

    # Test Case 3: One empty list, one non-empty list
    list2 = ListNode.new(0)
    merged = merge_two_lists(nil, list2)
    assert_equal 0, merged.val
    assert_nil merged.next
  end
end
