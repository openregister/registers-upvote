class RegistersController < ApplicationController
  before_action :set_register, only: [:edit, :update, :destroy, :upvote]

  def index
    @registers = Register.order(:name)
  end

  def new
    @register = Register.new
  end

  def edit
  end

  def create
    @register = Register.new(register_params)
    if @register.save
      redirect_to registers_path, notice: 'Register was successfully created.'
    else
      render :new
    end
  end

  def update
    if @register.update(register_params)
      redirect_to registers_path, notice: 'Register was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @register.destroy
    redirect_to registers_path, notice: 'Register was successfully destroyed.'
  end

  private

    def set_register
      @register = Register.find(params[:id])
    end

    def register_params
      params.require(:register).permit(:name)
    end
end
