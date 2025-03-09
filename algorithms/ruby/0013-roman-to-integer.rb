# frozen_string_literal: true

# 13. Roman To Integer
# https://leetcode.com/problems/roman-to-integer/

# @param {String} s
# @return {Integer}
def roman_to_int(s)
  map = { 'I' => 1, 'V' => 5, 'X' => 10, 'L' => 50, 'C' => 100,
          'D' => 500, 'M' => 1000 }

  num = 0
  i = 0

  while i < s.length
    if i + 1 < s.length && map[s[i]] < map[s[i + 1]]
      num += map[s[i + 1]] - map[s[i]]
      i += 2
    else
      num += map[s[i]]
      i += 1
    end
  end

  num
end

# **************** #
#       TEST       #
# **************** #

require 'test/unit'
class TestRomanToInteger < Test::Unit::TestCase
  def test_roman_to_int
    # Example 1: s = "III", Output: 3
    assert_equal 3, roman_to_int('III')

    # Example 2: s = "LVIII", Output: 58
    assert_equal 58, roman_to_int('LVIII')

    # Example 3: s = "MCMXCIV", Output: 1994
    assert_equal 1994, roman_to_int('MCMXCIV')

    # Additional test cases
    assert_equal 1, roman_to_int('I')
    assert_equal 4, roman_to_int('IV')
    assert_equal 9, roman_to_int('IX')
    assert_equal 40, roman_to_int('XL')
    assert_equal 90, roman_to_int('XC')
    assert_equal 400, roman_to_int('CD')
    assert_equal 900, roman_to_int('CM')
    assert_equal 2023, roman_to_int('MMXXIII')
    assert_equal 3999, roman_to_int('MMMCMXCIX')
  end
end
