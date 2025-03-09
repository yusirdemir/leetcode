# frozen_string_literal: true

# 9. Palindrome Number
# https://leetcode.com/problems/palindrome-number/

# @param {Integer} x
# @return {Boolean}
# def is_palindrome(x)
#     str_x = x.to_s
# 
#     for i in 0...(str_x.length / 2) 
#         if str_x[i] != str_x[-(i+1)]
#             return false
#         end
#     end
#     return true
# end

# def is_palindrome(x)
#   return false if x < 0 || (x % 10 == 0 && x != 0)
#   
#   reversed_half = 0
#   
#   while x > reversed_half
#     reversed_half = reversed_half * 10 + x % 10
#     x /= 10
#   end
#   
#   return x == reversed_half || x == reversed_half / 10
# end

def is_palindrome(x)
    return false if x < 0
    return x.to_s == x.to_s.reverse
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class TestPalindromeNumber < Test::Unit::TestCase
def test_palindrome_number
    # Example 1: x = 121, Output: true
    assert_equal true, is_palindrome(121)
    
    # Example 2: x = -121, Output: false
    assert_equal false, is_palindrome(-121)
    
    # Example 3: x = 10, Output: false
    assert_equal false, is_palindrome(10)
    
    # Additional test cases
    assert_equal true, is_palindrome(1221)
    assert_equal true, is_palindrome(12321)
    assert_equal false, is_palindrome(12345)
end
end