require './student.rb'

class Teacher < Person
  def initialize(specialization, id, name= 'Unknown', age, parent_permission: false)
    super(id, name, age, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_service?
    true
  end
end
  