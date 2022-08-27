require './person'

class Teacher < Person
  def initialize(specialization, age, name = 'Unknown', parent_permission: false)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_service?
    true
  end
end
