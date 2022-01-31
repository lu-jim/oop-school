# frozen_string_literal: true

# Define Person class
class Person
  attr_accessor :name, :age
  attr_writer :id

  def initialize(age, name = 'Unknown', parent_permission = 'Unknown')
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  private
  def is_of_age
    if @age< 18
       false
    else true
end
