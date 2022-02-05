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
    if valid_options.include? option
      serve(option)
    else
      puts 'Please enter a valid option'
      run
    end
  end

  def serve(option)
    case option
    when 1 then puts 'show_books'
    when 2 then puts 'show_people'
    when 3 then puts 'create_person'
    when 4 then puts 'create_book'
    when 5 then puts 'create_rental'
    when 6 then puts 'show_rentals'
    else puts 'Thank you for using this app'
    end
  end
end

def main
  app = App.new
  app.run
end

main
