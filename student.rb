# frozen_string_literal: true

require_relative 'person'

# Define Student class
class Student < Person
  def initialize(name, classroom)
    super(name)
    @classroom = classroom
  end
end

test = Student.new('Luis', '4-B')
puts(test)
