class List
  def self.list_all_rentals(rentals)
    print 'To see person rentals enter the person ID: '
    id = gets.chomp.to_i

    puts 'Rented Books:'
    rentals.each do |rental|
      if rental.person.id == id
        puts "Person: #{rental.person.name} Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
      end
    end
  end

  def self.list_all_books(books)
    puts 'Database is empty! Add a book.' if books.empty?
    books.each { |book| puts "[Book] Title: #{book.title}, Author: #{book.author}" }
  end

  def self.list_all_persons(persons)
    puts 'Database is empty! Add a person.' if persons.empty?
    persons.each { |person| puts "[#{person.class.name}] Name: #{person.name}, Age: #{person.age}, id: #{person.id}" }
  end
end
