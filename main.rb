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
    if @books.empty?
      puts 'No Books Found'
    else
      puts '  Title  | Author'
      @books.each_with_index do |book, index|
        puts "#{index + 1}. #{book.title} | #{book.author}"
      end
    end
    run
  end

  def show_people
    if @people.empty?
      puts 'No People Found'
    else
      @people.each_with_index do |person, index|
        puts "[#{person.type}]  #{index + 1}. Name: #{person.name} | ID: #{person.id} | Age: #{person.age}"
      end
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
  # rubocop:disable Metrics/MethodLength

  def create_rental
    if @books.empty?
      puts 'No books available for rent'
    elsif @people.empty?
      puts 'No people available for renting'
    else
      puts 'Select a book from the following list by number'
      @books.each_with_index do |book, index|
        puts "#{index + 1}. #{book.title} | #{book.author}"
      end
      rented_book = gets.chomp.to_i - 1
      validate_book(rented_book)
      puts 'Select a person from the following list by number'
      @people.each_with_index do |person, index|
        puts "[#{person.type}]  #{index + 1}. Name: #{person.name} | ID: #{person.id} | Age: #{person.age}"
      end
      renter = gets.chomp.to_i - 1
      validate_people(renter)
      puts 'Enter date'
      date = gets.chomp
      new_rental = Rental.new(date, @people[renter], @books[rented_book])
      @people[renter].add_rental(new_rental)
      @books[rented_book].add_rental(new_rental)
      @rentals << new_rental
      puts 'Rental has been created successfully'
    end
    run
  end
  # rubocop:enable Metrics/MethodLength

  def validate_book(book)
    valid_books = (1..@books.length).to_a
    return unless valid_books.include?(book)

    puts 'Please enter a valid book'
    create_rental
  end

  def validate_people(person)
    valid_people = (1..@people.length).to_a
    return unless valid_people.include?(person)

    puts 'Please enter a valid user'
    create_rental
  end

  def show_rentals; end
end

def main
  app = App.new
  app.run
end

main
