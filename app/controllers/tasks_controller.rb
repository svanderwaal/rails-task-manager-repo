class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def show
    if @task.completed == false
      @answer = 'This task is not completed yet🥺'
    else
      @answer = 'Task is completed😆'
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    # if @task.save
    #   redirect_to task_path(@task.id)
    # else
    #   render :new
    # end
    redirect_to tasks_path
  end

  def edit
  end

  def update
    # PATCH
    # update with new data
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
