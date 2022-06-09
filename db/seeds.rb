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

PROFILE_SUBJECTS = ['Economy A', 'Drawing A', 'Mathematics A', 'Portuguese']

# Creates user and links complete user profiles to them
puts "Creating User"
user = User.create!(email: "nathalie@gmail.com", password: "123456")
user_profile = UserProfile.new(first_name: "Nathalie",
                               last_name: "Roth",
                               school_name: "Collegio Elvetica",
                               school_year: "Year 12",
                               user: user,
                               main_subject: PROFILE_SUBJECTS[0],
                               specific_subject_a: PROFILE_SUBJECTS[1],
                               specific_subject_b: PROFILE_SUBJECTS[2],
                               optional_subject: PROFILE_SUBJECTS[3]
                              )
user_profile.save!

puts "User Email: #{user.email}, Password: #{user.password}"

# Creates records of subjects with subject ids
puts "Creating Subjects"
CSV.foreach(subject_filepath, headers: :first_row) do |row|
  Subject.find_or_create_by(name: row['subject_name'], color: row['subject_color'],
                            sid: row['s_id'], exam_date: row['exam_date'])
end

puts "Creating User Seeded Tests"
PROFILE_SUBJECTS.each do |name|
  subject = Subject.find_by(name: name)
  user.subjects << subject

  score = rand(10..80)

  (Date.today - 10.days..Date.today).each do |date|
    newscore = score + rand(-3..3)
    newscore = [newscore, 0].max
    newscore = [newscore, 100].min
    score = newscore

    test = Test.create!(
      status: :completed,
      user: user,
      score: score,
      subject: subject,
      created_at: date
    )

    puts "Test Score: #{test.score} Test Subject: #{test.subject.name}"
  end
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
