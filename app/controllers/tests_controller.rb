class TestsController < ApplicationController
  # before_action :set_test, only: [:show]

  def show
    @question = Question.last.question_content
    @answer = Answer.last.answer_content
    @questions = Question.all
    @answers = Answer.all

  end

  private

  def set_test
    # @test = Test.find(params[:id])
    # authorize @test
  end

end
