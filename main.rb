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

  def main
    @options = [
      'List all books', 'List all people', 'Create a person', 'Create a book',
      'Create a rental', 'List all rentals for a given person id', 'Exit'
    ]
  end
end
