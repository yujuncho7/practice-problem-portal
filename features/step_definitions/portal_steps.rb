# Create the instructors table
Given /the following instructors exist/ do |instructors|
	instructors.hashes.each do |instructor|
		Instructor.create!(instructor)
	end
end

# Create the students table
Given /the following students exist/ do |students|
	students.hashes.each do |student|
		Student.create!(student)
	end
end

# Create the problems table
Given /the following practice problems exist/ do |problems|
	problems.hashes.each do |problem|
		Problem.create!(problem)
	end
end