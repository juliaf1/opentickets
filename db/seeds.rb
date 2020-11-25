# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create Matheus

puts 'Creating some new skills **********'
skills = %w(Ruby HTML CSS Rails JavaScript Python C++ PHP)

skills.each do |skill| 
  Skill.create(name: skill)
  puts "#{skill} created as a skill"
end
puts '********** Skills Seeding Complete'



puts 'Creating some beautiful users **********'

lewagon_teachers = []
matheus = {
  first_name: 'Matheus',
  last_name: 'Penchel',
  email: 'mcpenchel@lewagon.com',
  password: '123456',
  hourly_rate: 100,
  bio: 'The Godfather of Lewagon Rio, master of the Mastadon and King of the Shrubbles. I can teach you almost anything you need to know.'
}
lewagon_teachers << matheus

ciro = {
  first_name: 'Ciro',
  last_name: 'Lima',
  email: 'climo@lewagon.com',
  password: '123456',
  hourly_rate: 5,
  bio: 'I can help you with any problem you have!'
}
lewagon_teachers << ciro

tatchi = {
  first_name: 'Tatchi',
  last_name: 'Wiggers',
  email: 'twiggers@lewagon.com',
  password: '123456',
  hourly_rate: 5,
  bio: "I have the coolest hair in Lewagon and there's nothing you can do about it"
}
lewagon_teachers << tatchi

pedro = {
  first_name: 'Pedro',
  last_name: 'Miranda',
  email: 'pmiranda@lewagon.com',
  password: '123456',
  hourly_rate: 5,
  bio: "Quero jogar futebol contigo"
}
lewagon_teachers << pedro

milene = {
  first_name: 'Milene',
  last_name: 'Cardoso',
  email: 'mcardoso@lewagon.com',
  password: '123456',
  hourly_rate: 1,
  bio: "I can teach you how to organise your life to be super productive and win at everything!"
}
lewagon_teachers << milene

marcel = {
  first_name: 'Marcel',
  last_name: 'Fonseca',
  email: 'mfonseca@lewagon.com',
  password: '123456',
  hourly_rate: 10,
  bio: "Learn some really cool stuff with me. I love to code and I love to teach!"
}
lewagon_teachers << marcel

lewagon_teachers.each do |teacher|
  User.create(teacher)
  puts "Created #{teacher[:first_name]}"
end

puts '********** User Seeding Complete'
puts 'Creating some user skills **********'

teachers = User.all
skills = Skill.all
teachers.each do |teacher|
  user_skills = skills.sample(rand(1..(skills.length)))
  user_skills.each do |skill|
    UserSkill.create(user: teacher, skill: skill)
  end
end

puts '********** User Skills Seeding Complete'

puts 'Creating some students **********'

students = []

kenneth = {
  first_name: 'Kenneth',
  last_name: 'Wall',
  email: 'kwall@lewagon.com',
  password: '123456',
  bio: "USA USA USA"
}
students << kenneth

filipe = {
  first_name: 'Filipe',
  last_name: 'Alencar',
  email: 'falencar@lewagon.com',
  password: '123456',
  bio: "JavaScript is Love"
}
students << filipe

gabriel = {
  first_name: 'Gabriel',
  last_name: 'Ferro',
  email: 'gferro@lewagon.com',
  password: '123456',
  bio: "Lady Gaga is my idol"
}
students << gabriel

students.each do |student|
  User.create(student)
  puts "Created #{student[:first_name]}"
end

puts '********** Students Created'

puts 'Creating Teacher Timeslots **********'

teachers = User.all.select { |user| user.hourly_rate }

teachers.each do |teacher|
  10.times do
    time = Time.now + rand(1..1000000)
    Timeslot.create(user_id: teacher.id, start_time: time )
  end
end

puts "********** #{Timeslot.count} Timeslots Created"

puts 'Creating Tickets **********'

students = User.all.reject { |user| user.hourly_rate }
available_timeslots = Timeslot.all

students.each do |student|
  10.times do
    description = "I need help with #{skills.sample.name}"
    timeslot = available_timeslots.sample
    Ticket.create(description: description, user: student, timeslot: timeslot)
    available_timeslots = available_timeslots.reject { |timeslot| timeslot == Ticket.last.timeslot }
  end
end
puts "********** #{Ticket.count} Tickets Created"