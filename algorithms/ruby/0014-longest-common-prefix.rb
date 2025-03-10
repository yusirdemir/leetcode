# frozen_string_literal: true

# 14. Longest Common Prefix
# https://leetcode.com/problems/longest-common-prefix/

# @param {String[]} strs
# @return {String}
# def longest_common_prefix(strs)
#   return '' if strs.empty?
#
#   map = {}
#   i = 0
#   j = 0
#   prefix = ''
#
#   while i < strs.length
#     break if j >= strs[i].length
#
#     char = strs[i][j]
#     map[char] = (map[char] || 0) + 1
#
#     if i + 1 >= strs.length
#       break unless map[char] == strs.length
#
#       prefix += char
#       map = {}
#       i = 0
#       j += 1
#
#     else
#       i += 1
#     end
#   end
#
#   prefix
# end

# @param {String[]} strs
# @return {String}
# def longest_common_prefix(strs)
#   return '' if strs.empty?
#   Array.new(strs.map(&:length).min).map.with_index{|_, i| ((strs.map{|o| o[i]}).uniq.length == 1) ? strs[0][i] : nil }.take_while{|k| k != nil}.join
# end

# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  return "" if strs.empty?

  reference = strs[0]

  reference.each_char.with_index do |char, i|
    strs.each do |str|
      return reference[0...i] if i >= str.length || str[i] != char
    end
  end

  reference
end

# **************** #
#       TEST       #
# **************** #

require 'test/unit'
class TestLongestCommonPrefix < Test::Unit::TestCase
  def test_longest_common_prefix
    # Example 1: strs = ["flower","flow","flight"], Output: "fl"
    assert_equal 'fl', longest_common_prefix(%w[flower flow flight])

    # Example 2: strs = ["dog","racecar","car"], Output: ""
    assert_equal '', longest_common_prefix(%w[dog racecar car])

    # Additional test cases
    assert_equal 'a', longest_common_prefix(['a'])
    assert_equal 'abc', longest_common_prefix(%w[abc abc abc])
    assert_equal '', longest_common_prefix([])
    assert_equal '', longest_common_prefix(['', 'b'])
    assert_equal 'c', longest_common_prefix(%w[c c])
    assert_equal 'app', longest_common_prefix(%w[apple app application])
  end
end