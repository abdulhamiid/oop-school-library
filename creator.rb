require './book'
require './person'
require './student'
require './teacher'

class Creator
  def Creator.create_book(books)
    puts 'Create a new book'
    print 'Enter title: '
    title = gets.chomp
    print 'Enter author: '
    author = gets
    book = Book.new(title, author)
    books.push(book)
    puts "Book #{title} created successfully."
  end 

  def Creator.create_student(persons)
    puts 'Create a new student'
    print 'Enter student age: '
    age = gets.chomp.to_i
    print 'Enter name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase
    case parent_permission
    when 'n'
      student = Student.new('undefined', age, name, parent_permission: false)
      persons << student
      puts 'Student doesnt have parent permission, cant rent books'
    when 'y'
      student = Student.new('undefined', age, name, parent_permission: true)
      persons << student
      puts 'Student created successfully'
    end
  end

  def Creator.create_teacher(persons)
    puts 'Create a new teacher'
    print 'Enter teacher age: '
    age = gets.chomp.to_i
    print 'Enter teacher name: '
    name = gets.chomp
    print 'Enter teacher specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name)
    persons.push(teacher)
    puts 'Teacher created successfully'
  end
end
