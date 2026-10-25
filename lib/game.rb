class Game
  def initialize(code)
    @code = code.to_s
    @input = 0
  end

  def input
    valid = false
    until valid
      print "enter your guess : "
      input_value = gets.chomp
      valid = true if input_value.to_i >= 1000 && input_value.to_i <= 9999
      valid = true if input_value == "exit"
    end
    input_value
  end

  def correct?(value_input)

    return true if value_input == @code 

    correct_position = 0
    correct_number_not_position = 0

    code_found = @code.split("")
    value = value_input.split("")

    for i in (0..3)
      if value[i] == code_found[i]
        correct_position += 1
        code_found[i] = "x"
        value[i] = "x"
      end
    end

    for i in (0..3)
      next if code_found[i] == "x"
      for j in (0..3)
        if code_found[i] == value[j]
          correct_number_not_position += 1
          code_found[i] = "x"
          value[j] = "x"
          break
        end
      end
    end

    give_hit(correct_number_not_position, correct_position)
    return false
  end

  def give_hit(number, position)
    if number > 0
      puts "#{number} number are correct but in wrong position"
    end
    if position > 0
      puts "#{position} number are correct and in correct position"
    end
    unless position > 0 || number > 0
      puts "none of the numbers are correct"
    end
  end

  def play
    turn_no = 1
    12.times do
      puts "turn no #{turn_no}"
      value = input
     if value == "exit"
      puts "exit the game the correct number was #{@code}"
      break
     elsif correct?(value)
      puts "correct the code was #{value}, you WIN!"
      break
     end
     turn_no += 1
    end
  end

end