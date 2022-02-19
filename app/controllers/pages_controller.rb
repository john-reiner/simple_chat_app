class PagesController < ApplicationController
  before_action :authenticate_user, only: %i[home]

  def home
    if @authenticated_user
      redirect_to @authenticated_user
    end

  end

  def about

  end
end
