require 'open-uri'

puts '*** Creating some new skills ***'

skills = %w(Ruby HTML CSS Rails JavaScript Python C++ PHP)

skills.each do |skill|
  Skill.create(name: skill)
  puts "#{skill} created as a skill"
end

puts '*** Skills Seeding Complete ***'

puts '*** Creating some beautiful users ***'

lewagon_teachers = []

matheus_avatar = URI.open("https://ca.slack-edge.com/T02NE0241-U3N8S3LFK-73039713a064-512")
matheus = {
  first_name: 'Matheus',
  last_name: 'Penchel',
  email: 'mcpenchel@lewagon.com',
  password: '123456',
  hourly_rate: 100,
  bio: 'The Godfather of Le Wagon Rio, master of the Mastadon and King of the Shrubbles. I can teach you almost anything you need to know.'
  }
matheus.photo.attach(io: matheus_avatar, filename: 'matheus.jpeg', content_type: 'image/jpeg')
lewagon_teachers << matheus

ciro_avatar = URI.open("https://ca.slack-edge.com/T02NE0241-USL030V24-5c51862252d8-512")
ciro = {
  first_name: 'Ciro',
  last_name: 'Lima',
  email: 'ciro@lewagon.com',
  password: '123456',
  hourly_rate: 50,
  bio: 'Master of APIs. I can help you with any problem you have!'
  }
ciro.photo.attach(io: ciro_avatar, filename: 'ciro.jpeg', content_type: 'image/jpeg')
lewagon_teachers << ciro

tatchi_avatar = URI.open("https://ca.slack-edge.com/T02NE0241-USJJY7ZUG-b163bf314111-512")
tatchi = {
  first_name: 'Tatchi',
  last_name: 'Wiggers',
  email: 'twiggers@lewagon.com',
  password: '123456',
  hourly_rate: 50,
  bio: "Queen of JavaScript, master of the wiggers. I have the coolest hair in Le Wagon and there's nothing you can do about it."
  }
tatchi.photo.attach(io: tatchi_avatar, filename: 'tatchi.jpeg', content_type: 'image/jpeg')
lewagon_teachers << tatchi

pedro_avatar = URI.open("https://ca.slack-edge.com/T02NE0241-US7288YNP-adabe5cee822-512")
pedro = {
  first_name: 'Pedro',
  last_name: 'Miranda',
  email: 'pedro@lewagon.com',
  password: '123456',
  hourly_rate: 5,
  bio: "Quero jogar futebol contigo."
  }
pedro.photo.attach(io: pedro_avatar, filename: 'pedro.jpeg', content_type: 'image/jpeg')
lewagon_teachers << pedro

milene_avatar = URI.open("https://ca.slack-edge.com/T02NE0241-UDE76BKKN-1936f122810b-512")
milene = {
  first_name: 'Milene',
  last_name: 'Cardoso',
  email: 'milene@lewagon.com',
  password: '123456',
  hourly_rate: 1,
  bio: "I have a 5 year plan for me and for all of you. Let's Marie Kondo your life to be super productive!"
  }
milene.photo.attach(io: milene_avatar, filename: 'milene.jpeg', content_type: 'image/jpeg')
lewagon_teachers << milene

marcel_avatar = URI.open("https://ca.slack-edge.com/T02NE0241-UDAKDMC5U-22cee4862fb3-512")
marcel = {
  first_name: 'Marcel',
  last_name: 'Fonseca',
  email: 'marcel@lewagon.com',
  password: '123456',
  hourly_rate: 10,
  bio: "Learn some really cool stuff with me and my crazy cats. I love to code and I love to teach!"
  }
marcel.photo.attach(io: marcel_avatar, filename: 'marcel.jpeg', content_type: 'image/jpeg')
lewagon_teachers << marcel

lewagon_teachers.each do |teacher|
  User.create(teacher)
  puts "Created #{teacher[:first_name]}"
end

puts '*** User Seeding Complete ***'
puts '*** Creating some User Skills ***'

teachers = User.all
skills = Skill.all

teachers.each do |teacher|
  user_skills = skills.sample(rand(1..(skills.length)))
  user_skills.each do |skill|
    UserSkill.create(user: teacher, skill: skill)
  end
end

puts '*** User Skills Seeding Complete ***'

puts '*** Creating some User Students ***'

students = []

kenneth_avatar = URI.open("https://ca.slack-edge.com/T02NE0241-U01CLNSQXBN-77d374596e5f-512")
kenneth = {
  first_name: 'Kenneth',
  last_name: 'Wall',
  email: 'kwall@lewagon.com',
  password: '123456',
  bio: "USA, USA, USA! Trump sucks!"
  }
kenneth.photo.attach(io: kenneth_avatar, filename: 'kenneth.jpeg', content_type: 'image/jpeg')
students << kenneth

filipe_avatar = URI.open("https://ca.slack-edge.com/T02NE0241-U01CELLS6G2-013b848074c6-512")
filipe = {
  first_name: 'Filipe',
  last_name: 'Alencar',
  email: 'falencar@lewagon.com',
  password: '123456',
  bio: "JavaScript is Love."
  }
filipe.photo.attach(io: filipe_avatar, filename: 'filipe.jpeg', content_type: 'image/jpeg')
students << filipe

gabriel_avatar = URI.open("https://ca.slack-edge.com/T02NE0241-U01D4HY364Q-acc38bde08a6-512")
gabriel = {
  first_name: 'Gabriel',
  last_name: 'Ferro',
  email: 'gferro@lewagon.com',
  password: '123456',
  bio: "Lady Gaga is my idol."
  }
gabriel.photo.attach(io: gabriel_avatar, filename: 'gabriel.jpeg', content_type: 'image/jpeg')
students << gabriel

cynthia_avatar = URI.open("https://ca.slack-edge.com/T02NE0241-U01BZSP6T1V-1ab6ccfc08af-512")
cynthia = {
  first_name: 'Cynthia',
  last_name: 'Tsai',
  email: 'ctsai@lewagon.com',
  password: '123456',
  bio: "Drums & Code!"
  }
cynthia.photo.attach(io: cynthia_avatar, filename: 'cynthia.jpeg', content_type: 'image/jpeg')
students << cynthia

students.each do |student|
  User.create(student)
  puts "Created #{student[:first_name]}"
end

puts '*** Students Created ***'

puts '*** Creating Teacher Timeslots ***'

teachers = User.all.select { |user| user.hourly_rate }

teachers.each do |teacher|
  10.times do
    time = Time.now + rand(1..1000000)
    Timeslot.create(user_id: teacher.id, start_time: time )
  end
end

puts "**** #{Timeslot.count} Timeslots Created ***"

puts '*** Creating Tickets ***'

students = User.all.reject { |user| user.hourly_rate }
available_timeslots = Timeslot.all

students.each do |student|
  10.times do
    description = "I need help with #{skills.sample.name}"
    timeslot = available_timeslots.sample
    # available_timeslots.delete(timeslot)
    Ticket.create(description: description, user: student, timeslot: timeslot)
    available_timeslots = available_timeslots.reject { |timeslot| timeslot == Ticket.last.timeslot }
  end
end

puts "*** #{Ticket.count} Tickets Created ***"
