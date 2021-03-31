class ProjectsController < ApplicationController
  def index
    @projects = Project.filter_by_user pundit_user
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = pundit_user.projects.new(project_params)
    if @project.save
      redirect_to @project
    else
      render :new
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to root_path
  end

  private
  def project_params
    params.require(:project).permit(:name);
  end
end
