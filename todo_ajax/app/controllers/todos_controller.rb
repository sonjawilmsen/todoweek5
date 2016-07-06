class TodosController < ApplicationController

  before_action :set_todo, only: [:show, :update, :destroy]


  def index
    @todo = Todo.new
    @todos = Todo.all.order(:id)
  end

  def new
    @todo = Todo.new
  end

  def create
  @todo = Todo.new(todo_params)

  respond_to do |format|
    if @todo.save
      format.html { redirect_to todos_path, notice: 'Todo was successfully created.' }
      format.json { render :show, status: :created, location: @todo }
    else
      format.html do
        @todos = Todo.all
        render :index
      end
      format.json { render json: @todo.errors, status: :unprocessable_entity }
    end
  end
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_todo
    @todo = Todo.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def todo_params
    params.require(:todo).permit(:title, :completed)
  end
end
