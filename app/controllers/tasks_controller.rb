class TasksController < ApplicationController
  before_action :set_task, only: %i[destroy update edit show]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    # bricolage qui fonctionne
    # @task = Task.create(title: params[:task][:title])
    @task = Task.create(task_params)
    redirect_to tasks_path
  end

  def edit
  end

  def update
    @task.update(task_params)
    raise
    # si completed n'est pas dans le hash, solution bricolage
    # @completed = params[:completed]
    # @task.update(completed: true) if @completed == '1'
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path status: :see_other
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
