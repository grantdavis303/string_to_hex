class WelcomeController < ApplicationController
  def index; end

  def results
    characters = get_count(params[:string])
    @hex = characters[0..2].map do |pair|
      pair[0] = pair[0].to_s
      pair[1] = convert_number(pair[1])
      pair.to_s.delete("\"[], ")
    end.to_s.delete("\"[], ")
  end

  private

  def get_count(converted_string)
    character_hash = {
      a: converted_string.chars.count("a"),
      b: converted_string.chars.count("b"),
      c: converted_string.chars.count("c"),
      d: converted_string.chars.count("d"),
      e: converted_string.chars.count("e"),
      f: converted_string.chars.count("f")
    }.sort_by { |key, value| value }.reverse
  end

  def convert_number(number)
    if number <= 9
      number
    else
      convert_number(number.digits.sum) # (number.to_s.chars.sum { |num| num.to_i })
    end
  end
end