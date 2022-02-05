require './person'
require './book'
require './rental'
require './classroom'
require './student'
require './teacher'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def run
    options = [
      'List all books', 'List all people', 'Create a person', 'Create a book',
      'Create a rental', 'List all rentals for a given person id', 'Exit'
    ]
    valid_options = (1..7).to_a
    puts 'Welcome to School Library App!
Please choose an option by entering a number:'
    options.each_with_index do |option, index|
      puts "#{index + 1} - #{option}"
    end
    option = gets.chomp.to_i
    unless valid_options.include? option
      puts 'Please enter a valid number'
      run
    end
  end
end

def main
  app = App.new
  app.run
end

main
