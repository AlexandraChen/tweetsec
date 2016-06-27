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
      puts matches
  end 

end

password = gets.chomp

check = Tweetsec.new(password)
check.split_word(password)
