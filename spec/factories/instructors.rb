FactoryGirl.define do
  factory :instructor do |instructor|
    instructor.email                 "boss@example.com"
    instructor.password              "password"
    instructor.password_confirmation "password"
  end
end
