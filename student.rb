require_relative 'person'

# Define Student class
class Student < Person
  def initialize(age, name, classroom)
    super(age, name)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
