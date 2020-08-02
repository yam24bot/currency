require './request.rb'

class Converter
  def initialize
    @json = Request.new.get_json
    @all_rates = @json['rates']
  end

  def input
    puts "Enter the first currency in ISO"
    @first_currency = gets.chomp

    puts "Enter the first value. You can use dots and comas"
    @first_value = gets.chop.to_i

    puts "Enter the second currency in ISO"
    @second_currency = gets.chomp
  end

  def calculate
    @second_value = (@first_value / @all_rates[@first_currency]) * @all_rates[@second_currency]
  end

  def output
    puts "Currency exchange rate from #{@first_currency} to #{@second_currency} to date #{@json["date"]}"
    puts @second_value.round(3)
  end
end
