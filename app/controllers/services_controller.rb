class ServicesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_service, only: [:show, :edit, :update, :delete, :destroy]
  layout "blog", only: [:index, :show]

  def index
    @services = Service.all
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to @service
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @service.update(update_params)
      redirect_to @service
    else
      render :edit
    end
  end

  def delete
  end

  def destroy
    @service.destroy
    redirect_to @service
  end

  def update_params; service_params end

  private

    def find_service
      @service = Service.find(params[:id])
    end

    def service_params
      params.require(:service).permit(:name, :description, :body, :service_id, pictures_attributes: [:id, :file, :_destroy])
    end
end
