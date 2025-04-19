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
    @test = Test.new(test_params)
    @test.author = User.first # Assuming the first user is the author for simplicity
    if @test.save
      redirect_to @test, notice: "Test was successfully created."
    else
      render :new
    end
  end
  def edit; end

  def update
    if @test.update(test_params)
      redirect_to @test, notice: "Test was successfully updated."
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
    params.require(:test).permit(:title, :level, :category_id)
  end
end
