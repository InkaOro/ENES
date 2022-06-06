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

  private

  def set_test
    # @test = Test.find(params[:id])
    # authorize @test
  end
end
