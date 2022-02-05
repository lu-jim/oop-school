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
    when 1 then puts show_books
    when 2 then puts show_people
    when 3 then puts create_person
    when 4 then puts create_book
    when 5 then puts create_rental
    when 6 then puts show_rentals
    else puts 'Thank you for using this app'
    end
  end

  def show_books
    puts '  Title  | Author'
    @books.each_with_index do |book, index|
      puts "#{index + 1}. #{book.title} | #{book.author}"
    end
    run
  end

  def show_people
    @people.each_with_index do |person, index|
      puts "[#{person.type}]  #{index + 1}. Name: #{person.name} | ID: #{person.id} | Age: #{person.age}"
    end
    run
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2) [Input the number]:'
    option = gets.chomp
    case option
    when '1' then create_student
    when '2' then create_teacher
    else
      puts 'Please enter a valid number'
      create_person
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission: [y/n]'
    permission = gets.chomp.downcase
    @people << Student.new(age, name, permission)
    puts 'Student has been created successfully'
    run
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    spec = gets.chomp
    @people << Teacher.new(age, name, spec)
    puts 'Teacher has been created successfully'
    run
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book has been created successfully'
    run
  end

  def create_rental
  end

  def show_rentals
  end
end

def main
  app = App.new
  app.run
end

main
