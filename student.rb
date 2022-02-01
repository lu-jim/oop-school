# frozen_string_literal: true

require_relative 'person'

# Define Person class
class Student < Person
  def initialize(age, name, classroom)
    super(age, name)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
