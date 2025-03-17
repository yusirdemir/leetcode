# frozen_string_literal: true

# 58. Length of Last Word
# https://leetcode.com/problems/length-of-last-word/

# Given a string s consisting of words and spaces, return the length of the last word in the string.
# A word is a maximal substring consisting of non-space characters only.

# @param {String} s
# @return {Integer}
def length_of_last_word(s)
  s.split.last.length
end

# **************** #
#       TEST       #
# **************** #

require 'test/unit'

class TestLengthOfLastWord < Test::Unit::TestCase
  def test_length_of_last_word
    assert_equal 5, length_of_last_word('Hello World')
    assert_equal 4, length_of_last_word('   fly me   to   the moon  ')
    assert_equal 6, length_of_last_word('luffy is still joyboy')
    assert_equal 1, length_of_last_word('a')
    assert_equal 1, length_of_last_word('a ')
    assert_equal 3, length_of_last_word('day')
  end
end
