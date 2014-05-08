class PagesController < ApplicationController
  before_action :authenticate_user!, only: [
    :inside
  ]

  def home
  end

  def inside
  end

  def entry
    redirect_to home_path
  end

end
