class TestsController < ApplicationController
  before_action :find_test, only: %i[show edit update destroy]
  before_action :find_questions, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :test_not_found

  def index
    @tests = Test.includes(:questions).order(created_at: :desc)
  end

  def show; end

  def new
    @test = User.first.created_tests.build
  end

  def create
    @test = User.first.created_tests.build(test_params)
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

  def find_test
    @test = Test.find(params[:id])
  end

  def find_questions
    @questions = @test.questions
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def test_not_found
    redirect_to tests_path, alert: "Test not found"
  end
end
