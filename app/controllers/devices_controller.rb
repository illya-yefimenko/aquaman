class DevicesController < ApplicationController

  before_action :set_create_project, only: [:new, :create]
  before_action :set_project, only: [:show]

  def show
    @device = Device.find(params[:id])
  end

  def index
    @devices = Device.all
  end

  def new
    @device = Device.new
  end

  def create
    authorize @project, :create_device?
    @device = @project.devices.new(device_params)

    if @device.save
      redirect_to @device
    else
      render :new
    end
  end

  def edit
    @device = Device.find(params[:id])
  end

  def update
    @device = Device.find(params[:id])
    if @device.update(device_params)
      redirect_to @device
    else
      render :edit
    end
  end

  def destroy
    @device = Device.find(params[:id])
    @device.destroy

    redirect_to root_path
  end


  private

  def device_params
    params.require(:device).permit(:name);
  end

  def set_create_project
    @project = Project.find params[:project_id]
  end
  def set_project
    @project = Device.find(params[:id]).project
  end


  end
