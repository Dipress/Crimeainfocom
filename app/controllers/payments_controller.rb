class PaymentsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: [:index, :show, :list]
  before_action :find_payment, only: [:show, :edit, :update, :delete, :destroy]
  layout "blog", only: [:index, :show]

  def index
    @payments = Payment.all
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    if @payment.save
      redirect_to @payment
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @payment.update(update_params)
      redirect_to @payment
    else
      render :edit
    end
  end

  def delete
  end

  def destroy
    @payment.destroy
    redirect_to @payment
  end

  def update_params; payment_params end

  private

    def payment_params
      params.require(:payment).permit(:title, :body, :slug)
    end

    def find_payment
      @payment = Payment.find(params[:id])
    end
end
