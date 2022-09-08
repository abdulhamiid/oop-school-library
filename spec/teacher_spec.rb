require '../book'
require '../teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new('JavaScript', 70, 'Coltz')
  end

  context 'when an object of class teacher is created' do
    it 'should have correct details' do
      expect(@teacher.age).to eq 70
      expect(@teacher.name).to eq 'Coltz'
      expect(@teacher.can_use_service?).to be true
      expect(@teacher.specialization).to eq 'JavaScript'
    end
  end

  # context 'when a teacher rents out a book' do
  #   it 'should have' do
  #     @teacher.add_rental('2022/08/30', Book.new('Tom and Jerry', 'Cartoon Martz'))
  #     @teacher.add_rental('2022/08/31', Book.new('Algorithms in Ruby', 'Roberto Tammasia'))
  #     expect(@teacher.rentals.length).to be 2
  #   end
  # end

  context 'when can_use_services method is tested' do
    it 'should return true' do
      expect(@teacher.can_use_service?).to eq true
    end
  end
end
