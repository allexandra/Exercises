class Dictionary
  attr_accessor :first, :second
  def initialize
    @words = File.readlines('dictionary.txt').each {|line| line.chomp!}
  end
  def input
    puts "first word: "
    @first = gets.chomp
    if @words.include?(@first) == false
      puts "first word: "
      @first = gets.chomp
    end
    puts "second word: "
    @second = gets.chomp
    if @words.include?(@second) == false
      puts "second word: "
      @second = gets.chomp
    end
  end
end

d = Dictionary.new

