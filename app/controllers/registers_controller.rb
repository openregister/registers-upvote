class RegistersController < ApplicationController
  before_action :set_register, only: [:edit, :update, :destroy, :show, :approve]

  def index
    @registers = Register.order(:approved)
  end

  def new
    @register = Register.new
    @register.votes.build
  end

  def show
  end

  def edit
  end

  def approve
    @register.update_attributes(approved: :true)
    redirect_to registers_path, notice: 'Register has been approved'
  end

  def create
    @register = Register.new(register_params)
    if @register.save
      redirect_to @register
      # TODO: RegisterMailer.suggested_register(@register).deliver_now
    else
      render :new
    end
  end

  def update
    if @register.update(register_params)
      redirect_to root_path, notice: 'Register was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @register.destroy
    redirect_to root_path, notice: 'Register was successfully destroyed.'
  end

  private

    def set_register
      @register = Register.find(params[:id])
    end

    def register_params
      params.require(:register).permit(:name, :approved, votes_attributes: [:id, :email, interest: []])
    end
end
