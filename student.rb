class Student < Person
  attr_reader :classroom

  def initialize(age, name, classroom)
    super(age, name)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
