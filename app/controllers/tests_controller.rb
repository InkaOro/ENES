class TestsController < ApplicationController
  # before_action :set_test, only: [:show]

  def show
    @questions = Question.all
  end

  private

  def set_test
    # @test = Test.find(params[:id])
    # authorize @test
  end
end
