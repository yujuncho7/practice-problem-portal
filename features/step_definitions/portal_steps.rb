# Create the instructors table
Given /the following users exist/ do |instructors|
	instructors.hashes.each do |instructor|
		Instructor.create!(instructor)
	end
end