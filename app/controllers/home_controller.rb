class HomeController < ApplicationController

  def index
    if user_signed_in?
      @profile = current_user.profile
    end
  end

  def about
  end

  def privacy
  end

  def terms
  end

  def contact
  end


end
