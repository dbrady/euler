# If the numbers 1 to 5 are written out in words: one, two, three,
# four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in
# total.
# 
# If all the numbers from 1 to 1000 (one thousand) inclusive were
# written out in words, how many letters would be used?
# 
# NOTE: Do not count spaces or hyphens. For example, 342 (three
# hundred and forty-two) contains 23 letters and 115 (one hundred and
# fifteen) contains 20 letters. The use of "and" when writing out
# numbers is in compliance with British usage.

#     1 3 one
#     2 3 two
#     3 5 three
#     4 4 four
#     5 4 five
#     6 3 six
#     7 5 seven
#     8 5 eight
#     9 4 nine
#    10 3 ten
#    11 6 eleven 
#    12 6 twelve
#    13 8 thirteen
#    14 8 fourteen
#    15 7 fifteen
#    16 7 sixteen
#    17 9 seventeen
#    18 8 eighteen
#    19 8 nineteen
#    20 6 twenty
#    30 6 thirty
#    40 5 forty
#    50 5 fifty
#    60 5 sixty
#    70 5 seventy
#    80 6 eighty
#    90 6 ninety

# Scoring n % 100 value:
# If n % 100 < 20, add the score above.
# If n % 100 >= 20, add the tens value: twenty, thirty, fourty, etc., to the ones value (n % 1)
# 
# If n > 100, add 10 for "hundred and".
# If 100 < n < 1000, take the hundreds digit and add its value (one, two, etc)
#
# If n = 1000, score 10 for "one thousand"

class Numeric
  LETTER_COUNTS = {
    0 => 0, # doesn't count!
    1 => 3, # one
    2 => 3, # two
    3 => 5, # three
    4 => 4, # four
    5 => 4, # five
    6 => 3, # six
    7 => 5, # seven
    8 => 5, # eight
    9 => 4, # nine
    10 => 3, # ten
    11 => 6, # eleven 
    12 => 6, # twelve
    13 => 8, # thirteen
    14 => 8, # fourteen
    15 => 7, # fifteen
    16 => 7, # sixteen
    17 => 9, # seventeen
    18 => 8, # eighteen
    19 => 8, # nineteen
    20 => 6, # twenty
    30 => 6, # thirty
    40 => 5, # forty
    50 => 5, # fifty
    60 => 5, # sixty
    70 => 7, # seventy
    80 => 6, # eighty
    90 => 6 # ninety
  }
  def digit_at(place)
    p1 = 10**(place+1)
    n = self % 10**(place+1)
    if place > 0
      p0 = 10**place
      n = (n - self % p0) / p0
    end
    n
  end

  def letter_count
    lc = 0
    ones = digit_at 0
    decades = digit_at 1
    lc += if decades == 1
            LETTER_COUNTS[self % 100]
          else
            LETTER_COUNTS[ones]
          end

    lc += LETTER_COUNTS[decades*10] if decades > 1

    hundreds = digit_at 2
    if hundreds > 0
      lc += 7 + LETTER_COUNTS[hundreds]
      lc += 3 if ones + decades > 0
    end
    
    thousands = digit_at 3
    if thousands > 0
      lc += 8 + LETTER_COUNTS[thousands]
    end

    lc
  end
end
  

puts (1..1000).map {|i| j=i; i.letter_count}.inject {|a,b| a+b}

def check_number(n, str)
  ct = str.gsub(/[- ]/,'').size
  unless n.letter_count == ct
    puts "Aww, crap! #{str} should have #{ct} letters, but actually had #{n.letter_count}"
    exit
  end
end


check_number(1, "one")
check_number(2, "two")
check_number(3, "three")
check_number(4, "four")
check_number(5, "five")
check_number(6, "six")
check_number(7, "seven")
check_number(8, "eight")
check_number(9, "nine")
check_number(10, "ten")
check_number(11, "eleven")
check_number(12, "twelve")
check_number(13, "thirteen")
check_number(14, "fourteen")
check_number(15, "fifteen")
check_number(16, "sixteen")
check_number(17, "seventeen")
check_number(18, "eighteen")
check_number(19, "nineteen")
check_number(20, "twenty")
check_number(21, "twenty-one")
check_number(22, "twenty-two")
check_number(30, "thirty")
check_number(33, "thirty-three")
check_number(40, "forty")
check_number(44, "forty-four")
check_number(50, "fifty")
check_number(55, "fifty-five")
check_number(60, "sixty")
check_number(66, "sixty-six")
check_number(70, "seventy")
check_number(77, "seventy-seven")
check_number(80, "eighty")
check_number(88, "eighty-eight")
check_number(90, "ninety")
check_number(99, "ninety-nine")
check_number(100, "one hundred")
check_number(101, "one hundred and one")
check_number(102, "one hundred and two")
check_number(110, "one hundred and ten")
check_number(111, "one hundred and eleven")
check_number(118, "one hundred and eighteen")
check_number(120, "one hundred and twenty")
check_number(122, "one hundred and twenty-two")
check_number(200, "two hundred")
check_number(1000, "one thousand")

