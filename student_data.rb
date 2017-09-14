

students = []
eye_colors = []
ages = []

File.open("student_data.csv").each do |line|
	info = line.split(",")
	students.push(info[0].strip)
	eye_colors.push(info[1].strip)
	ages.push(info[2].strip.to_i)
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

# puts count_brown_eyes(eye_colors)

def old_enough_to_drive (ages, students)
	drivers = []
	ages.each_with_index do |age, i|
		if age >= 16
			drivers.push(students[i])
		end
	end
	return drivers
end

# print old_enough_to_drive(ages, students)


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

# print green_eyed_girls(students, eye_colors)

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

# print green_eyed_average_age(eye_colors, ages)