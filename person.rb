class Person
  def initialize(id, name= 'Unknown', age, parent_permission: false)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
  def id
    @id
  end
  def name
    @name
  end
  def age
    @age
  end
  def name=(name)
    @name = name
  end
  def age=(age)
    @age = age
  end
  def can_use_service?
    is_of_age? || @parent_permission
  end

  private 
  def is_of_age?
    @age >= 18
  end
end
