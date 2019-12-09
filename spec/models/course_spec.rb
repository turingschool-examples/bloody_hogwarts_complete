require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:students).through(:student_courses)}
  end

  describe 'instance methods' do
    describe '.student_count' do
      it "returns the number of students enrolled" do
        harry = Student.create(name: "Harry Potter", house: "Griffyndor", age: 14)
        casseopia = Student.create(name: "Casseopia Black", age: 18, house: "Slytherin")

        potions = harry.courses.create!(name: "Potions")
        potions.students << casseopia

        expect(potions.student_count).to eq(2)
      end
    end
  end
end
