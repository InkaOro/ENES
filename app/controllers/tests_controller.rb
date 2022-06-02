class TestsController < ApplicationController
  # before_action :set_test, only: [:show]

  def show
    @questions = Question.last.question_content
    @answers = Answer.last.answer_content
  end

  private

  def set_test
    # @test = Test.find(params[:id])
    # authorize @test
  end

end
