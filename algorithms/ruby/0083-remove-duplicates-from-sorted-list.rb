# frozen_string_literal: true

# 83. Remove Duplicates from Sorted List
# https://leetcode.com/problems/remove-duplicates-from-sorted-list/

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# @param {ListNode} head
# @return {ListNode}
# def delete_duplicates(head)
#   return head if head.nil? || head.next.nil?
#
#   current = head
#   while current && current.next
#     if current.val == current.next.val
#       current.next = current.next.next
#     else
#       current = current.next
#     end
#   end
#
#   head
# end

# @param {ListNode} head
# @return {ListNode}
# Tail Call Optimization with recursive approach
def delete_duplicates(head)
  return head if head.nil? || head.next.nil?
  
  delete_duplicates_tco(head, head)
end

def delete_duplicates_tco(head, current)
  return head if current.nil? || current.next.nil?
  
  if current.val == current.next.val
    current.next = current.next.next
    delete_duplicates_tco(head, current)
  else
    delete_duplicates_tco(head, current.next)
  end
end

# **************** #
#       TEST       #
# **************** #

require 'test/unit'

class TestDeleteDuplicates < Test::Unit::TestCase
  def test_delete_duplicates
    # Test Case 1: [1,1,2] -> [1,2]
    list1 = ListNode.new(1)
    list1.next = ListNode.new(1)
    list1.next.next = ListNode.new(2)
    
    result1 = delete_duplicates(list1)
    assert_equal 1, result1.val
    assert_equal 2, result1.next.val
    assert_nil result1.next.next
    
    # Test Case 2: [1,1,2,3,3] -> [1,2,3]
    list2 = ListNode.new(1)
    list2.next = ListNode.new(1)
    list2.next.next = ListNode.new(2)
    list2.next.next.next = ListNode.new(3)
    list2.next.next.next.next = ListNode.new(3)
    
    result2 = delete_duplicates(list2)
    assert_equal 1, result2.val
    assert_equal 2, result2.next.val
    assert_equal 3, result2.next.next.val
    assert_nil result2.next.next.next
    
    # Test Case 3: Empty list
    assert_nil delete_duplicates(nil)
    
    # Test Case 4: Single element
    list4 = ListNode.new(1)
    result4 = delete_duplicates(list4)
    assert_equal 1, result4.val
    assert_nil result4.next
    
    # Test Case 5: Multiple duplicates in a row
    list5 = ListNode.new(1)
    list5.next = ListNode.new(1)
    list5.next.next = ListNode.new(1)
    list5.next.next.next = ListNode.new(2)
    list5.next.next.next.next = ListNode.new(3)
    list5.next.next.next.next.next = ListNode.new(3)
    
    result5 = delete_duplicates(list5)
    assert_equal 1, result5.val
    assert_equal 2, result5.next.val
    assert_equal 3, result5.next.next.val
    assert_nil result5.next.next.next
  end
end 