require_relative '../student'
require_relative '../classroom'

describe Student do
  before :each do
    @student = Student.new(nil, 13, 'Anastacia Atieno', parent_permission: false)
  end

  context 'when an object of class Student is created' do
    it 'should have correct details' do
      expect(@student.age).to eq 13
      expect(@student.name).to eq 'Anastacia Atieno'
      expect(@student.can_use_service?).to be false
      expect(@student.classroom).to be nil
    end
  end

  context 'when a student is created with classroom' do
    it 'should have same classroom as in contructor' do
      classroom = Classroom.new('4S')
      student = Student.new(classroom, 60, 'Felix Matiko')
      expect(student.classroom).to eq classroom
    end
  end

  context 'when play hooky method is tested' do
    it 'should return ¯\(ツ)/¯' do
      expect(@student.play_hooky).to eq "¯\(ツ)/¯"
    end
  end
end
