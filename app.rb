require './classroom'
require './creator'
require './list'

class App
  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def start_console
    puts 'Welcome to my School Library!'
    until list_of_options
      input = gets.chomp
      if input == '7'
        puts 'Thank You for using my School Library!'
        break
      end

      option input
    end
  end

  def list_all_books
    puts 'Database is empty! Add a book.' if @books.empty?
    @books.each { |book| puts "[Book] Title: #{book.title}, Author: #{book.author}" }
  end

  def list_all_persons
    puts 'Database is empty! Add a person.' if @persons.empty?
    @persons.each { |person| puts "[#{person.class.name}] Name: #{person.name}, Age: #{person.age}, id: #{person.id}" }
  end

  def create_person
    print 'To create a student, press 1, to create a teacher, press 2 : '
    option = gets.chomp

    case option
    when '1'
      Creator.create_student(@persons)
    when '2'
      Creator.create_teacher(@persons)
    else
      puts 'Invalid input. Try again'
    end
  end

  def create_book
    Creator.create_book(@books)
  end

  def create_rental
    Creator.create_rental(@persons, @books, @rentals)
  end

  def list_all_rentals
    List.list_all_rentals(@rentals)
  end
end
