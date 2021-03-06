class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
    @project.clients.build
    authorize @project
  end

  def create
    @project = Project.create(project_params)
    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end

  def edit
    authorize @project
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :main_image, :mobile_image, :desktop_image, :logo, :tablet, :phone, :url, clients_attributes: [:first_name, :last_name, :email, :phone_number, :business_name, :description])
  end
end
