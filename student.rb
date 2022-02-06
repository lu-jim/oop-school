class Student < Person
  attr_reader :classroom, :type

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(age, name = 'Unknown', parent_permission = true)
    super
    @type = 'Student'
  end
  # rubocop:enable Style/OptionalBooleanParameter

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
