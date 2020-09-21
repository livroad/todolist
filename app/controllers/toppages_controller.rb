class ToppagesController < ApplicationController
  def index
    if logged_in?
      @dolist = current_user.dolists.build
      @dolists = current_user.dolists.order(id: :desc).page(params[:id])
    end
  end
end
