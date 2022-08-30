class TasksController < ApplicationController
  before_action :set_task, only: [:update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:create, :update]

  def create
    @job = Job.find(params[:job_id])
    @task = Task.new(task_params)
    @task.job = @job
    authorize @task
    if @task.save
      respond_to do |format|
        format.html
        format.text { render partial: "jobs/tasks", locals: { tasks: @job.tasks.order(:done, :created_at) }, formats: [:html] }
      end
    else
      # render partial: "jobs/tasks", status: :unprocessable_entity
      render :index, status: :unprocessable_entity

    end
  end

  def update
    authorize @task
    unless @task.update(task_params)
      render partial: "jobs/tasks", status: :unprocessable_entity
    end
  end

  def destroy
    authorize @task
    @task.destroy
    respond_to do |format|
      format.html
      format.text { render partial: "jobs/tasks", locals: { tasks: @job.tasks.order(:done, :created_at) }, formats: [:html] }
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :done)
  end
end
