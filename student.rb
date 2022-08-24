require './person'

class Student < Person
  def initialize(classroom, id, age, name = 'Unknown', parent_permission: false)
    super(id, age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
