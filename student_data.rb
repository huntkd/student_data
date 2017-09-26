
students = []
eye_colors = []
ages = []
blood_types = []

File.open("student_data.csv").each do |line|
	info = line.split(",")
	students.push(info[0].strip)
	eye_colors.push(info[1].strip)
	ages.push(info[2].strip.to_i)
	blood_types.push(info[3].strip)
end

# print students, "\n"
# print eye_colors, "\n"
# print ages, "\n"


def count_brown_eyes (eye_colors)
	n = 0
	eye_colors.each do |eye_color|
		if eye_color == "Brown"
			n += 1
		end
	end

	return n
end

#puts count_brown_eyes(eye_colors)


def old_enough_to_drive (ages, students)
	drivers = []
	ages.each_with_index do |age, i|
		if age >= 16
			drivers.push(students[i])
		end
	end
	return drivers
end

#print old_enough_to_drive(ages, students)


def green_eyed_girls (students, eye_colors)
	girl_list = []
	green_eyed_girl_list = []
	students.each_with_index do |students, i|
		if i%2 == 0
			girl_list.push(eye_colors[i])
			girl_list.push(students[i])
		end
	end
	girl_list.each_with_index do |eye_color, i|
		if eye_color == "Green"
			green_eyed_girl_list.push(students[i])
		end
	end

	return green_eyed_girl_list
end

#print green_eyed_girls(students, eye_colors)


def vowel_counter (students)
	number_of_vowels = 0
	students.chars.each do |letter|
		if letter == "a" || letter == "e" || letter == "i" || letter == "o" || letter == "u" 
			number_of_vowels += 1
		end	
	end
	return number_of_vowels
end

def sophomore_with_the_most_vowels (ages, students)
	most_vowels = ""
	sophomore = []
	ages.each_with_index do |age, i|
		if age == 15
			sophomore.push(students[i])
		end
	end
	sophomore.each_with_index do |sophomore, i|
		if vowel_counter(sophomore) > vowel_counter(most_vowels)
			most_vowels = sophomore
		end
	end
	return most_vowels
end

#print sophomore_with_the_most_vowels(ages, students)


def green_eyed_average_age (eye_colors, ages)
	green_eyed_list = []
	total_age = 0
	people = 0
	average_age = 0
	eye_colors.each_with_index do |eye_color, i|
		if eye_color == "Green"
			green_eyed_list.push(ages[i])
			people += 1
		end
	end
	green_eyed_list.each_with_index do |age, i|
		total_age += ages[i]
		average_age = total_age / people
	end

	return average_age
end

#print green_eyed_average_age(eye_colors, ages)


def green_eyed_closest_to_average (eye_colors, ages, students)
	average = green_eyed_average_age(eye_colors, ages)
	student_closest_to_average = ""
	distance_to_average = 50
	eye_colors.each_with_index do |eye_color, i|
		distance_to_age = (ages[i] - average).abs
		if eye_color == "Green"	
			if distance_to_age < distance_to_average
				distance_to_average = distance_to_age
				student_closest_to_average = students[i]
			end
		end
	end
	return student_closest_to_average
end

#print green_eyed_closest_to_average(eye_colors, ages, students)

def in_array(array, check_value)
	array.each do |value|
		if value == check_value
			return true
		end
	end
	return false
end


def donors_for_student (students, blood_types, student_needing_blood)
	donors = []
	student_blood_type = ""
	students.each_with_index do |student, i|
		if student == student_needing_blood
			student_blood_type = blood_types[i]
		end
	end
	matching_types = []
	if student_blood_type == "O"
		matching_types = ["A", "B", "O", "AB"]
	elsif student_blood_type == "A"
		matching_types = ["A", "AB"]
	elsif student_blood_type == "B"
		matching_types = ["B", "AB"]
	elsif student_blood_type == "AB"
		matching_types = ["AB"]
	end
	blood_types.each_with_index do |blood_type, i|
		if in_array(matching_types, blood_type)
			donors.push(students[i])
		end
	end
	return donors
end

#print donors_for_student(students, blood_types, "Gloria")



def most_blood_donors (students, blood_types)
	max_donors = 0
	most_donors = []

	students.each_with_index do |student_needing_blood, i|
		donors = donors_for_student(students, blood_types, student_needing_blood)
		if donors.length > max_donors
			max_donors = donors.length
		end
	end
	students.each_with_index do |student_needing_blood, i|
		donors = donors_for_student(students, blood_types, student_needing_blood)
		if donors.length == max_donors
			max_donors = donors.length
			most_donors.push(students[i])
		end
	end
	return most_donors
end

print most_blood_donors(students, blood_types)

