require 'Pry'

class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @id = params['id']
    @question = Question.find(params['id'])
    @answers = @question.answers
    @answer = Answer.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to @question, notice: 'Question was successfully added.'
    else
      flash[:notice] = 'Invalid Question.'
      render :new
    end

  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params['id'])
  end

  def update
    @question = Question.find(params['id'])
    if @question.update(question_params)
      redirect_to @question, notice: 'Question was successfully updated.'
    else
      flash[:notice] = 'Invalid Edit Parameters.'
      render :edit
    end
  end

  def destroy
    Question.delete(params['id'])
    Answer.delete_all(question_id: params['id'])
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
