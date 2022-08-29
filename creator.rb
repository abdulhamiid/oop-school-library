require './book'
require './person'
require './student'
require './teacher'
require './rental'

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

  def Creator.create_rental(persons, books, rentals)
    puts 'Select which book you want to rent by entering its number'
    books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }

    book_id = gets.chomp.to_i

    puts 'Select a person from the list by its number'
    persons.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_id = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp.to_s

    rental = Rental.new(date, books[book_id], persons[person_id])
    rentals << rental

    puts 'Rental created successfully'
  end
end
