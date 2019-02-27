class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :destroy, :edit, :update]
  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to todo_path(@todo)
      flash[:notice] = "Post successfully created"
    else
      render 'new'
    end
  end

  def destroy
    @todo.destroy
    flash[:notice] = "Todo was deleted succesfully"
    redirect_to(todos_path)
  end

  def show
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      flash[:notice] = "Todo was succesfully updated"
      redirect_to todo_path(@todo)
    else
      render 'edit'
    end
  end

  private

    def set_todo
      @todo = Todo.find(params[:id])
    end

    def todo_params
      params.require(:todo).permit(:name, :description)
    end

end
