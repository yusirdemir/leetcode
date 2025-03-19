# frozen_string_literal: true

# 67. Add Binary
# https://leetcode.com/problems/add-binary/

# @param {String} a
# @param {String} b
# @return {String}
# def add_binary(a, b)
#   (a.to_i(2) + b.to_i(2)).to_s(2)
# end

# @param {String} a
# @param {String} b
# @return {String}
def add_binary(a, b)
  carry = 0
  result = ''

  max_length = [a.length, b.length].max
  a = a.rjust(max_length, '0')
  b = b.rjust(max_length, '0')

  (max_length - 1).downto(0) do |i|
    bit_a = a[i].to_i
    bit_b = b[i].to_i

    sum = bit_a + bit_b + carry
    result = (sum % 2).to_s + result
    carry = sum / 2
  end

  result = "1#{result}" if carry == 1

  result
end

# **************** #
#       TEST       #
# **************** #

require 'test/unit'

class TestAddBinary < Test::Unit::TestCase
  def test_add_binary
    assert_equal '100', add_binary('11', '1')
    assert_equal '10101', add_binary('1010', '1011')
    assert_equal '0', add_binary('0', '0')
    assert_equal '1', add_binary('0', '1')
    assert_equal '1', add_binary('1', '0')
    assert_equal '11', add_binary('1', '10')
    assert_equal '110', add_binary('11', '11')
    assert_equal '10000', add_binary('1111', '1')
  end
end
