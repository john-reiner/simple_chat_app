class PagesController < ApplicationController
  before_action :authenticate_user

  def home
    if @authenticated_user
      redirect_to @authenticated_user
    end

  end

  def about

  end
end
