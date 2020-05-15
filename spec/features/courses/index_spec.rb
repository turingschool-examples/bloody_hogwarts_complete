# User Story 3 of 4
# As a visitor,
# When I visit '/courses'
# I see a list of courses and the number of students enrolled in each course.
#
# (e.g. "Defense Against the Dark Arts: 5"
#       "Herbology: 10")

require 'rails_helper'

RSpec.describe 'course index' do
  it "shows the course and the count of students" do
    harry = Student.create(name: "Harry Potter", house: "Griffyndor", age: 14)
    casseopia = Student.create(name: "Casseopia Black", age: 18, house: "Slytherin")

    potions = Course.create!(name: "Potions")
    spells = Course.create!(name: "Spells")

    potions.students << casseopia
    potions.students << harry
    spells.students << harry

    visit '/courses'

    within "#course-#{potions.id}" do
      expect(page).to have_content("#{potions.name}: #{potions.student_count}")
    end

    within "#course-#{spells.id}" do
      expect(page).to have_content("#{spells.name}: #{spells.student_count}")
    end
  end

  it "shows courses and students in alphabetical order" do
    harry = Student.create(name: "Harry Potter", house: "Griffyndor", age: 14)
    casseopia = Student.create(name: "Casseopia Black", age: 18, house: "Slytherin")

    potions = Course.create!(name: "Potions")
    spells = Course.create!(name: "Spells")

    potions.students << casseopia
    potions.students << harry
    spells.students << harry

    visit '/courses'

    within "#course-#{potions.id}" do
      expect(casseopia.name).to appear_before(harry.name)
    end
  end
end
