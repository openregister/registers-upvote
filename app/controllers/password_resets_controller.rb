class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user.present?
      user.regenerate_password_reset_token
      user.update_attributes!(password_reset_sent_at: Time.zone.now)
      UserMailer.forgot_password(user).deliver_now
      redirect_to signin_path, notice: 'Please check your email'
    else
      flash.now[:alert] = 'This user does not exist'
      render :new
    end
  end

  def edit
    @user = User.find_by!(password_reset_token: params[:id])
  end

  def update
    @user = User.find_by(password_reset_token: params[:id])

    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, notice: 'Your password reset token has expired'
    elsif @user.update_attributes(user_params)
      redirect_to signin_path, notice: 'You can use your new password'
    else
      render :edit
    end
  end

  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

end
