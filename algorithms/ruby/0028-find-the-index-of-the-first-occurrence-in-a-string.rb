# frozen_string_literal: true

# 28. Find the Index of the First Occurrence in a String
# https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/

# Kısa çözüm (Ruby'nin yerleşik index metodu ile)
# @param {String} haystack
# @param {String} needle
# @return {Integer}
# def str_str(haystack, needle)
#   haystack.index(needle) || -1
# end

# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
  return 0 if needle.empty?
  return -1 if needle.length > haystack.length

  n = needle.length
  m = haystack.length

  i = 0
  while i <= m - n
    if haystack[i] == needle[0]
      j = 1

      j += 1 while j < n && haystack[i + j] == needle[j]

      return i if j == n
    end

    i += 1
  end

  -1
end

# **************** #
#       TEST       #
# **************** #

require 'test/unit'

class TestFindIndex < Test::Unit::TestCase
  def test_str_str
    # Example test cases
    assert_equal(0, str_str('sadbutsad', 'sad'), "First example: 'sad' in 'sadbutsad'")
    assert_equal(-1, str_str('leetcode', 'leeto'), "Second example: 'leeto' in 'leetcode'")

    # Special cases
    assert_equal(0, str_str('hello', ''), 'Empty needle case')
    assert_equal(-1, str_str('abc', 'abcd'), 'Needle longer than haystack')
    assert_equal(6, str_str('hello world', 'world'), 'Needle at the end of haystack')
    assert_equal(0, str_str('abababa', 'aba'), 'Multiple occurrences case')
    assert_equal(2, str_str('hello', 'l'), 'Single character case')
    assert_equal(-1, str_str('hello', 'z'), 'No match case')
  end
end
