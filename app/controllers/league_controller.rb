class LeagueController < ApplicationController
  def dashboard
    redirect_to '/users/sign_in' unless user_signed_in?
  end

  def info
    redirect_to '/users/sign_in' unless user_signed_in?
  end

  def lineup
    redirect_to '/users/sign_in' unless user_signed_in?
    @yet_drafted = true
  end

  def trade
    redirect_to '/users/sign_in' unless user_signed_in?
  end

  def draft
    redirect_to '/users/sign_in' unless user_signed_in?
  end
  
  def autopick
    redirect_to '/users/sign_in' unless user_signed_in?
  end
  
  def result
    redirect_to '/users/sign_in' unless user_signed_in?
  end
end
