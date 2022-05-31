# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"
require "byebug"

puts "Cleaning DB"

Answer.destroy_all
Question.destroy_all
Subject.destroy_all
Topic.destroy_all


p "cleaned the DB"

topic_filepath = "lib/seeds/topics.csv"
question_filepath = "lib/seeds/questions.csv"
answer_filepath = "lib/seeds/answers.csv"

qtype = %w[main specific optional]


CSV.foreach(topic_filepath, headers: :first_row) do |row|
  subject = Subject.create!(name: row['subject_name'])
  p subject
  topic = Topic.create!(name: row['name'], subject: subject)
  p topic
end

## if you want more topics


CSV.foreach(question_filepath, headers: :first_row) do |row|
  Question.create!(qid:row["id"],question_content: row['question_content'],question_type: qtype.sample,topic: Topic.all.sample)
end


Question.all.each do |question|
  CSV.foreach(answer_filepath, headers: :first_row) do |row|
    if question.qid == row['question_id']
      Answer.create!(answer_content: row['answer_content'], correct: row['Correct?'] == "true", question: question)
    end
  end
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
