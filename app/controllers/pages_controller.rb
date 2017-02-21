class PagesController < ApplicationController
  def index
    if user_signed_in?
      redirect_to '/offers'
    else
      redirect_to '/pages/welcome'
    end
  end
end
