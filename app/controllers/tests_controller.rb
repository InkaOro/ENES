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

    params[:test_answers].each do |_index, answer_id|
      @test.test_answers.build(answer_id: answer_id)
    end

    @test.save!

    redirect_to test_path(@test)
  end

  def create
    # 1. get questions for the subject in params POST /tests params[:subject_id]
    #  1.1 @questions = Question.where(topic: { subject_id: params[:subject_id] }).includes(:topic)
    @questions = Question.where(topic: { subject_id: params[:subject_id] }).includes(:topic)
    # 2. initialize a new test @test = Test.new(user: current_user)
    @test = Test.new(user: current_user)
    @test.save
    @test.questions << @questions
    redirect_to edit_test_path(@test)
  end

  private

  def set_test
    # @test = Test.find(params[:id])
    # authorize @test
  end

  def tests_params
    params.require(:tests).permit(:subject_id)
  end

end
