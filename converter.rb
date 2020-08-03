require './request.rb'
require 'pry'

class Converter
  def initialize
    puts "On what date do you want to use the exchange rate in format XXXX-MM-DD"
    date = gets.chomp
    # date = '2020-12-12'
    @json = Request.new.get_json(date)
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
