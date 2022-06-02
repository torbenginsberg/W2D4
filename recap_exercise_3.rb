def no_dupes?(arr)
    counter = Hash.new(0)
    arr.each { |ele| counter[ele] += 1 }
    new = counter.select { |k, v| v < 2 }
    new.keys
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    arr.each_with_index do |ele, i|
        if ele == arr[i + 1]
            return false
        end
    end
    true
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    hash = Hash.new { |h, k| h[k] = [] }
    str.each_char.with_index { |char, i| hash[char] << i }
    hash
end

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    test_streak = ""
    longest = ""
    (0...str.length).each do |i|
        if str[i] == str[i - 1] || i == 0
            test_streak += str[i]
        else
            test_streak = str[i]
        end

        if test_streak.length >= longest.length
            longest = test_streak
        end
    end
end

# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

def bi_prime?(num)
    factors = []
    (2...num).each { |fact| factors << fact if num % fact == 0 }
    factors.all? { |num| is_prime?(num) }
end

def is_prime?(num)
    return  false if num < 2
    (2...num).none? { |i| num % i == 0 }
end

# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def encrypt_char(char, num)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    old_idx = alphabet.index(char)
    new_idx = (old_idx + num) % 26
    alphabet[new_idx]
end

def vigenere_cipher(str, seq)
    encrypted = ""
    str.each_char.with_index do |char, i|
        new_num = i % seq.length
        new_char = encrypt_char(char, seq[new_num])
        encrypted += new_char
    end

    encrypted
end

# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)
    new_str = str[0..-1]
    vowels = "aeiou"
    vowel_indices = []
    str.each_char.with_index { |char, i| vowel_indices << i if vowels.include?(char) }
    rotated_indices = vowel_indices.rotate(-1)

    vowel_indices.each_with_index do |ele, i|
        rotated_vowel = str[rotated_indices[i]]
        new_str[ele] = rotated_vowel
    end
    new_str
end
    

# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"

class String

    def select(&prc)
        prc ||= Proc.new { |char| char = "" }

end