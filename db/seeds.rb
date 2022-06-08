# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"
# require "byebug"

puts "Cleaning DB"

TestAnswer.destroy_all
TestQuestion.destroy_all
Answer.destroy_all
Question.destroy_all
UserSubject.destroy_all
Test.destroy_all
Subject.destroy_all
UserProfile.destroy_all
User.destroy_all

puts " DB Cleaned"


# Outlines the files required to seed the questions / answers datasets
subject_filepath = "lib/seeds/subjects.csv"
question_filepath = "lib/seeds/questions.csv"
answer_filepath = "lib/seeds/answers.csv"

# Creates user and links complete user profiles to them
puts "Creating Users"
user = User.create!(email: "test5678@gmail.com", password: "123456")
user_profile = UserProfile.new(first_name: "Dimitris",
                               last_name: "Samouris",
                               school_name: "St. Lawrence College",
                               school_year: "Year 10",
                               user: user
                              )
user_profile.save
puts "User Email: #{user.email}, Password: #{user.password}"

# Creates records of subjects with subject ids
puts "Creating Subjects"
CSV.foreach(subject_filepath, headers: :first_row) do |row|
  subject = Subject.find_or_create_by(name: row['subject_name'], color: row['subject_color'], sid: row['s_id'])
  p subject
end

# Creates records of questions with question ids
puts "Creating and linking Questions"
Subject.all.each do |subject|
  CSV.foreach(question_filepath, headers: :first_row) do |row|
    if subject.sid == row['s_id']
      Question.create!(qid: row['q_id'], question_content: row['question_content'], subject: subject)
    end
  end
end


puts "Creating and linking Answers"
# Creates answer records and links them to each question id
Question.all.each do |question|
  CSV.foreach(answer_filepath, headers: :first_row) do |row|
    if question.qid == row['q_id']
      Answer.create!(content: row['answer_content'], correct: row['Correct?'] == "true", question: question)
    end
  end
end

# Creatse 3 tests for each user with a hard-coded score
puts "Creating Tests"
6.times do
  test = Test.new(score: rand(0..100), subject: Subject.all.sample)
  test.user = user
  test.save
  puts "Test Score: #{test.score} Test Subject: #{test.subject.name}"
end
