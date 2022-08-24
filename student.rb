require './person.rb'

class Student < Person
  def initialize(classroom, id, name= 'Unknown', age, parent_permission: false, classroom)
    super(id, name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
