class Tweetsec


  def initialize(password)
    @password = password
  end

  
  def split_word(str)
    @result = []
    chas = str.split("")
    len = chas.size
    (0..len-1).each do |i|
      (i..len-1).each do |j|
        @result << chas[i..j].join
      end
    end
    find_matches
  end

  def find_matches
    matches = []
    words = File.readlines('en.txt')
    @result.each do |word| 
      words.each do |line|
        if line.strip == word
          matches << word
        end
      end
    end

    if matches.size > 0 
      longest_word = matches.max_by(&:length)
      word_substitution(longest_word)
    else
      check_strength(@password)
    end
    
  end 


  def word_substitution(longest_word)
    random_letter = ('a'..'z').to_a[rand(26)]
    new_password = @password.gsub(longest_word, random_letter*longest_word.size)
    check_strength (new_password)
  end

  def check_strength(password)
    score = 0
    score += 5 if password.match(/\w/)
    score += 10 if password.match(/\d/)
    score += 15 if password.match(/\s/)
    score += 20 if password.match(/[^0-9A-Za-z]/)
    check_level(score)
    
  end

  def check_level(score)
    puts score
    if score >= 50
      puts "Your password is strong"
    elsif score > 10 && score < 50
      puts "Your password is weak"
    else
      puts "Your password is unacceptable"
    end
  end

end

password = gets.chomp

check = Tweetsec.new(password)
check.split_word(password)
