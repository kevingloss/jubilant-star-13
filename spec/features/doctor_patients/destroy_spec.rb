require 'rails_helper'

RSpec.describe "Doctor show page" do
  before :each do
    @h1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @h2 = Hospital.create!(name: "Black Swan Memorial Hospital")

    @d1 = @h1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @d2 = @h1.doctors.create!(name: "Gray Anatomy", specialty: "Plastic Surgery", university: "Doctor University")
    @d3 = @h1.doctors.create!(name: "John Smith", specialty: "Pediatrist", university: "Harvard University")
    @d4 = @h1.doctors.create!(name: "Jane Smith", specialty: "Pediatrist", university: "Harvard University")
    @d5 = @h2.doctors.create!(name: "Harold Riviera", specialty: "Cardiologist", university: "Columbia University")

    @p1 = Patient.create!(name: "Marley Johanson", age: 37)
    @p2 = Patient.create!(name: "Jones Johanson", age: 40)
    @p3 = Patient.create!(name: "Tyler Smith", age: 30)
    @p4 = Patient.create!(name: "Dan McNeil", age: 33)
    @p5 = Patient.create!(name: "Wade Wilson", age: 45)

    @dp1 = DoctorPatient.create!(doctor: @d1, patient: @p1)
    @dp2 = DoctorPatient.create!(doctor: @d1, patient: @p2)
    @dp3 = DoctorPatient.create!(doctor: @d1, patient: @p3)
    @dp4 = DoctorPatient.create!(doctor: @d1, patient: @p4)
    @dp5 = DoctorPatient.create!(doctor: @d2, patient: @p1)
    @dp6 = DoctorPatient.create!(doctor: @d2, patient: @p5)
  end

  it 'can remove a patient from a doctors workload' do
    visit doctor_path(@d1)

    expect(page).to have_content(@p1.name)

    within("#doc_pat-#{@dp1.id}") do
      click_button "Remove Patient"
    end

    expect(current_path).to eq(doctor_path(@d1))
    expect(page).to_not have_content(@p1.name)
  end
end