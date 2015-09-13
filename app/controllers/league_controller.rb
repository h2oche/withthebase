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
  
  def create_new_league
    params[:league_name]
    params[:league_emblem]
    params[:league_is_classic]
    params[:league_period]
    params[:league_is_public]
    
    params[:league_draft_time]
    
    params[:league_password]
    
    params[:league_limit]
    params[:league_draft_time_limit]
    
    params[:league_admin_teamname]
  end
end
