FactoryGirl.define do
  factory :student do |student|
    student.email                 "test@example.com"
    student.password              "password"
    student.password_confirmation "password"
    student.completed_problems    Hash.new
  end
end
