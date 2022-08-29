class List
  def List.list_all_rentals(rentals)
    print 'To see person rentals enter the person ID: '
    id = gets.chomp.to_i

    puts 'Rented Books:'
    rentals.each do |rental|
      if rental.person.id == id
        puts "Person: #{rental.person.name} Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
      else
        puts
        puts 'No records where found for the given ID'
      end
    end
  end
end