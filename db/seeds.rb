User.create(email: Faker::Internet.email, password: "PASSword99!", title: Faker::Name.title, location: Faker::GameOfThrones.city, about_me: Faker::Hipster.paragraph(2, true, 4))
User.create(username: "Silver Snake", email: Faker::Internet.email, password: "PASSword99!", title: Faker::Name.title, location: Faker::GameOfThrones.city, about_me: Faker::Hipster.paragraph(2, true, 4))
User.create(username: "Red Jaguar", email: Faker::Internet.email, password: "PASSword99!", title: Faker::Name.title, location: Faker::GameOfThrones.city, about_me: Faker::Hipster.paragraph(2, true, 4))
User.create(username: "Green Monkey", email: Faker::Internet.email, password: "PASSword99!", title: Faker::Name.title, location: Faker::GameOfThrones.city, about_me: Faker::Hipster.paragraph(2, true, 4))
User.create(username: "Baby Einstein", email: Faker::Internet.email, password: "PASSword99!", title: Faker::Name.title, location: Faker::GameOfThrones.city, about_me: Faker::Hipster.paragraph(2, true, 4))
User.create(username: "Doctor_who_yana", email: Faker::Internet.email, password: "PASSword99!", title: Faker::Name.title, location: Faker::GameOfThrones.city, about_me: Faker::Hipster.paragraph(2, true, 4))
User.create(username: "Fearless Kettle", email: Faker::Internet.email, password: "PASSword99!", title: Faker::Name.title, location: Faker::GameOfThrones.city, about_me: Faker::Hipster.paragraph(2, true, 4))
User.create(username: "Giant Momma", email: Faker::Internet.email, password: "PASSword99!", title: Faker::Name.title, location: Faker::GameOfThrones.city, about_me: Faker::Hipster.paragraph(2, true, 4))
User.create(username: "Abstract Cat", email: Faker::Internet.email, password: "PASSword99!", title: Faker::Name.title, location: Faker::GameOfThrones.city, about_me: Faker::Hipster.paragraph(2, true, 4))
User.create(username: "Thirsty Blast", email: Faker::Internet.email, password: "PASSword99!", title: Faker::Name.title, location: Faker::GameOfThrones.city, about_me: Faker::Hipster.paragraph(2, true, 4))

def randomname
  num = rand(0..2)
  if num == 0
   Faker::Pokemon.name
 elsif num == 1
   Faker::Hipster.word.capitalize + ' ' + Faker::Hipster.word.capitalize
 elsif num == 2
   nil
 end
end

50.times do
  User.create(
  username: randomname,
  email: Faker::Internet.email,
  password: "PASSword99!",
  title: Faker::Name.title,
  location: Faker::GameOfThrones.city,
  about_me: Faker::Hipster.paragraph(2, true, 4))
end

20.times do
  Question.create(
  title: Faker::Hipster.sentence(3, false, 4),
  question: Faker::Hipster.paragraph(10, false, 10),
  user_id: rand(1..User.all.count)
  )
end

def answer_smart
  answer = ''
  answer += Faker::Hacker.say_something_smart + ''
  answer += Faker::Hacker.say_something_smart + ''
  answer += Faker::Hacker.say_something_smart + ''
  answer += Faker::Hacker.say_something_smart + ''
  answer += Faker::Hacker.say_something_smart + ''
  answer += Faker::Hacker.say_something_smart + ''
  answer += Faker::Hacker.say_something_smart + ''
  answer += Faker::Hacker.say_something_smart + ''
  answer += Faker::Hacker.say_something_smart + ''
  answer += Faker::Hacker.say_something_smart + ''
  answer += Faker::Hacker.say_something_smart + ''
  answer += Faker::Hacker.say_something_smart + ''
  answer += Faker::Hacker.say_something_smart + ''
  return "#{answer}"
end

30.times do
  Answer.create(
  answer: answer_smart,
  user_id: rand(1..User.all.count),
  question_id: rand(1..20)
  )
end

100.times do
  question = Question.find(rand(1..20))
  question.votes.create(
  votable_id: question.id,
  votable_type: question,
  user_id: rand(1..User.all.count)
  )
end

30.times do
  question = Question.find(rand(1..20))
  question.comments.create(
  commentable_id: question.id,
  commentable_type: question,
  user_id: rand(1..User.all.count),
  comment: Faker::Hipster.sentence(3, false, 4)
  )
end
