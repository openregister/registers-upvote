class PagesController < ApplicationController
  def home
    @registers = Register.approved.order(:name)
  end
end
