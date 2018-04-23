class StaticPagesController < ApplicationController
  include FlickrHelper

  def Home
    unless params[:user_id].nil?
      @user_id = params[:user_id]
    end
  end



end
