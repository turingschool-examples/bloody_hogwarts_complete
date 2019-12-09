# User Story 2 of 4
#
# As a visitor,
# When I visit '/students/:id'
# I see a list of the students' courses.
#
# (e.g. "Defense against the Dark Arts"
#       "Herbology"
#       "Potions")
require 'rails_helper'

RSpec.describe 'student show page' do
  it "shows the students courses" do
    harry = Student.create(name: "Harry Potter", house: "Griffyndor", age: 14)

    potions = harry.courses.create!(name: "Potions")
    spells = Course.create!(name: "Spells")

    StudentCourse.create!(student: harry, course: spells)

    visit "/students/#{harry.id}"

    expect(page).to have_content(potions.name)
    expect(page).to have_content(spells.name)
  end
end
