class TestsController < ApplicationController
  before_action :set_test, only: %i[show edit update destroy]

  def index
    @tests = Test.includes(:questions)
  end

  def show
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def create
    @test = User.first.created_tests.new(test_params)
    if @test.save
      redirect_to test_path(@test), flash: { notice: "Test was successfully created." }
    else
      render :new
    end
  end

  def create_test_passage
    @test = Test.find(params[:test_id])
    @test_passage = TestPassage.new(user: User.first, test: @test)

    if @test_passage.save
      redirect_to test_test_passage_path(@test, @test_passage)
    else
      redirect_to tests_path, alert: "Could not start the test."
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to @test, flash: "Test was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_url, notice: "Test was successfully deleted."
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end
end
