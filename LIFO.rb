class Lifo
  def initialize
    @list = []
    @index = 0
  end
  def push element

    puts "PUSH:"
    puts "index: #{@index}"

    @list[@index] = element
    @index += 1

    print @list, "\n"
    puts "index: #{@index}", "\n"

  end
  def pop
    if @index > 0

      puts "POP:"
      puts "index: #{@index}"

      @index -= 1
      elem = @list[@index]
      @list.delete_at(@index)

      print @list, "\n"
      puts "index: #{@index}", "\n"

      elem
    end
  end
  def print_elements
    @list.each do
    |i| puts i
    end
  end
end

a = Lifo.new
a.push "a"
a.push 1
a.push 'abc'
a.print_elements
a.pop
a.print_elements