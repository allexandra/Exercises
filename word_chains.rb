class Dictionary
  def initialize
    @shortest_way = nil
    @words = Hash.new

    # read the file and browse the lines (each line is a new word)
    File.readlines('dictionary.txt').each do |line|
      line.chomp!

      # make an empty array if this is the first word of its length
      @words[line.length] = [] if @words[line.length].nil?

      # add the word in the appropriate array in the hash
      @words[line.length] << line
    end
  end

  def input
    puts "first word: "
    @first = gets.chomp

    # verify if the first word is included in the hash
    while @words[@first.length].include?(@first) == false
      puts "first word: "
      @first = gets.chomp
    end

    puts "second word: "
    @second = gets.chomp

    # verify if the second word is included in the hash
    # it should have the same length as the first word
    while @words[@first.length].include?(@second) == false
      puts "second word: "
      @second = gets.chomp
    end
  end

  def different_chars(a,b)

    # init number of different chars - 0 by default
    difference = 0

    # split word b into an array of characters
    b_chars = b.split('')

    a.split('').each_with_index do |char, index|
      # find the number of different characters between the two words
      difference += 1 if char != b_chars[index]
    end

    # return the difference
    difference
  end

  def chain(path)

    # check if the second word can be added right away to the current path
    if different_chars(path.last, @second) == 1
      # it only differs by one char - add it to the path
      path << @second
    end

    # if the second word is part of the path
    if path.include?(@second)

      p "Current length: #{path.length}" if @shortest_way.nil? || path.length < @shortest_way.length

      # check if this path is the shortest way and store it if so
      @shortest_way = path if @shortest_way.nil? || path.length < @shortest_way.length

      # only continue if the current path + one word is shorter that the shortest way - 1
      # otherwise we can't get a shorter way that the existing one
    elsif @shortest_way.nil? || path.length < (@shortest_way.length - 1)

      # browse the list of words that have the needed length
      @words[@first.length].each do |word|

        # only consider words that aren't already added to the current path
        unless path.include?(word)
          # and that differ from the last word in the path by one character
          if different_chars(path.last, word) == 1
            # clone the current path
            a = path.clone
            # add the new word to it
            a << word

            # call chain again to continue building the path
            chain(a)
          end
        end
      end
    end

    # return the shortest way
    @shortest_way
  end

  def get_chain
    chain([@first])
  end

end

d = Dictionary.new
d.input
p d.get_chain


