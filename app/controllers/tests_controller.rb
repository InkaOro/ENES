class TestsController < ApplicationController
  # before_action :set_test, only: [:show]

  def show
    @test = Test.find(params[:id])
  end

  def edit
    @test = Test.find(params[:id])
  end

  def update
    @test = Test.find(params[:id])

    if @test.update(test_params)
      @test.update(score: @test.correct_percentage, status: :completed)
      redirect_to test_path(@test)
    else
      render :edit
    end
  end

  def create
    # 1. get questions for the subject in params POST /tests params[:subject_id]
    @questions = Question.where(subject_id: params[:subject_id]).limit(4)
    # 2. initialize a new test @test = Test.new(user: current_user)
    @test = Test.new(user: current_user, subject_id: params[:subject_id])
    @test.save!
    @test.questions << @questions
    redirect_to edit_test_path(@test)
  end

  private

  def set_test
    # @test = Test.find(params[:id])
    # authorize @test
  end

  def test_params
    params.require(:test).permit(test_answers_attributes: [:answer_id, :question_id, :id])
  end

end
