class HomeController < ApplicationController
  def index
    if user_signed_in?
      @babies = current_user.babies
    end
  end
end
