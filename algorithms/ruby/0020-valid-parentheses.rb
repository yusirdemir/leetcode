# frozen_string_literal: true

# 20. Valid Parentheses
# https://leetcode.com/problems/valid-parentheses/

# @param {String} s
# @return {Boolean}
# def is_valid(s)
#   return true if s.empty?
#
#   stack = []
#   opening_brackets = ['(', '{', '[']
#   bracket_pairs = { ')' => '(', '}' => '{', ']' => '[' }
#
#   s.each_char do |char|
#     if opening_brackets.include?(char)
#       stack.push(char)
#     else
#       return false if stack.empty?
#
#       last_opening_bracket = stack.pop
#       return false unless last_opening_bracket == bracket_pairs[char]
#     end
#   end
#
#   stack.empty?
# end

# @param {String} s
# @return {Boolean}
def is_valid(s)
  return true if s.empty?

  stack = []
  s.each_char do |c|
    case c
    when '(', '{', '['
      stack.push(c)
    when ')'
      return false if stack.pop() != '('
    when '}'
      return false if stack.pop() != '{'
    when ']'
      return false if stack.pop() != '['
    end
  end

  stack.empty?
end

# **************** #
#       TEST       #
# **************** #

require 'test/unit'
class TestValidParentheses < Test::Unit::TestCase
  def test_is_valid
    # Example 1: s = "()", Output: true
    assert_equal true, is_valid('()')

    # Example 2: s = "()[]{}", Output: true
    assert_equal true, is_valid('()[]{}')

    # Example 3: s = "(]", Output: false
    assert_equal false, is_valid('(]')

    # Example 4: s = "([])". Output: true
    assert_equal true, is_valid('([])')

    # Additional test cases
    assert_equal false, is_valid('(')
    assert_equal false, is_valid(')')
    assert_equal false, is_valid('((')
    assert_equal false, is_valid('){')
    assert_equal false, is_valid('([)]')
    assert_equal true, is_valid('')
    assert_equal true, is_valid('{[]}')
    assert_equal false, is_valid('(((((()))))))')
    assert_equal false, is_valid('())')
    assert_equal false, is_valid('(()()()()[]')
  end
end
