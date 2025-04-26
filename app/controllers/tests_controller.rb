class TestsController < ApplicationController
  before_action :set_test, only: %i[show edit update destroy start]
  before_action :set_user, only: :start

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
    @test = User.first.tests.new(test_params)
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

  def start
    @test_passage = current_user.test_passages.create!(test: @test)
    redirect_to @test_passage
  end

  private

  def set_test
      @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def set_user
    @user = User.first
  end

  def current_user
    User.first
  end
end
