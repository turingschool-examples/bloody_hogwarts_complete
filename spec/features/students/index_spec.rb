# User Story 1 of 4
#
# As a visitor,
# When I visit '/students',
# I see a list of students with the following information:
# -Name
# -Age
# -House
# (e.g. "Name: Casseopia Black, Age: 14, House: Slytherin")
require 'rails_helper'

RSpec.describe "Student Index" do
  it "Shows a list of students and their info" do
    harry = Student.create(name: "Harry Potter", house: "Griffyndor", age: 14)
    casseopia = Student.create(name: "Casseopia Black", age: 18, house: "Slytherin")

    visit '/students'

    within "#student-#{harry.id}" do
      expect(page).to have_content(harry.name)
      expect(page).to have_content(harry.age)
      expect(page).to have_content(harry.house)
    end

    within "#student-#{casseopia.id}" do
      expect(page).to have_content(casseopia.name)
      expect(page).to have_content(casseopia.age)
      expect(page).to have_content(casseopia.house)
    end
  end
end
