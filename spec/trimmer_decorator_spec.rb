require_relative '../trimmer_decorator'
require_relative '../person'

describe TrimmerDecorator do
  before :each do
    @person = Person.new(33, 'Habeebullahi')
    @trimmer_decorator = TrimmerDecorator.new(@person)
  end

  context 'when an object of trimmer decorator is created' do
    it 'should have correct type and details' do
      expect(@trimmer_decorator).to be_kind_of Decorator
      expect(@trimmer_decorator).to be_instance_of TrimmerDecorator
      expect(@trimmer_decorator.correct_name).to eq 'Habeebulla'
    end
  end

  context 'when a trimmer_decorator.correct_name is called ' do
    it 'should have correct_name trimmed' do
      @person.name = 'abdulhamidadio'
      expect(@trimmer_decorator.correct_name).to eq 'abdulhamid'
    end
  end
end
