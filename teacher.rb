require './student'

class Teacher < Person
  def initialize(specialization, id, age, name = 'Unknown', parent_permission: false)
    super(id, age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_service?
    true
  end
end
