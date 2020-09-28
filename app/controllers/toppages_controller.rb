class ToppagesController < ApplicationController
  def index
    @dolists = Dolist.order(id: :desc).page(params[:page]).per(24)
  end
end
