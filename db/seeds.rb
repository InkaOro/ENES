# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

puts "Cleaning DB"
Subject.destroy_all
Topic.destroy_all
Question.destroy_all
Answer.destroy_all


subject_filepath = "lib/seeds/subjects.csv"
topic_filepath = "lib/seeds/topics.csv"
question_filepath = "lib/seeds/questions.csv"
answer_filepath = "lib/seeds/answers.csv"

CSV.foreach(subject_filepath, headers: :first_row) do |row|
  Subject.create!(name: row['name'])
  p "#{row['name']}"
end

CSV.foreach(topic_filepath, headers: :first_row) do |row|
  Topic.create!(name: row['name'], subject_id: row['subject_id'])
end

CSV.foreach(question_filepath, headers: :first_row) do |row|
  Question.create!(question_content: row['question_content'], topic_id: row['topic_id'])
  Question.create!(type: row['type'], topic_id: row['topic_id'])
end

CSV.foreach(answer_filepath, headers: :first_row) do |row|
  Answer.create!(answer_content: row['answer_content'], question_id: row['question_id'])
  Answer.create!(correct: row['correct'], answer_id: row['answer_id'])
end

# CSV.foreach(question_filepath, headers: :first_row) do |row|
#   # Question.create.question_content = row['Question Text']
#   # Question.create.type = row['Question Text']
#   p "#{row['Question Text']}"
# end

# CSV.foreach(answer_filepath, headers: :first_row) do |row|
#   # Question.create.answer_content = row['Option Text']
#   p "#{row['Option Text']}"
# end

# Fake data seeds

# subjects = Subject.all

# subjects.each do |subject|
#   Topic.create!(name: subject['name'], subject_id: subject.id)

#   topics = Topic.all

#   topics.each do |topic|
#     Question.create!(topic: topic)

#     questions = Question.all

#     questions.each do |question|
#       Answer.create!(question_id: question.id)
#     end
#   end
# end
