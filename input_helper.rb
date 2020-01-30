require './event'
class InputHelper
  def input_handler
    GC.disable
    puts "no of inputs"
    count = gets.chop.to_i
    (1..count).each do 
      input = gets.chop
      fetch_duration(input)
      name = input
      Event.new(name, duration)
    end
  end

  def fetch_duration(input)
    lightning?(input) ? 5 : input.split(" ").last.delete("min").to_i
  end  

  def lightning?(input)
    input.downcase.include?("lightning")
  end
end