class Registers::VotesController < ApplicationController
  before_action :set_register

  def new
    @register.vote = Vote.new
  end

  def create
    @vote = @register.votes.new(vote_params)
    if @vote.save
      session[:user_email] = @vote.email
      redirect_to registers_path, notice: 'Your vote has been counted, thank you for your interest'
    else
      render :new
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:email, :interest, :register_id)
  end

  def set_register
    @register = Register.find(params[:register_id])
  end
end
