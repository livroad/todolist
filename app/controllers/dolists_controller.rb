class DolistsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @dolist = current_user.dolists.build(dolist_params)
    
    if @dolist.save
      flash[:success] = 'タスクを登録しました。'
      redirect_to root_url
    else
      @dolists = current_user.dolists.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'タスクの登録に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @dolist.destroy
    flash[:success] = 'タスクを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def dolist_params
    params.require(:dolist).permit(:content)
  end
  
  def correct_user
    @dolist = current_user.dolists.find_by(id: params[:id])
    unless @dolist
      redirect_to root_url
    end
  end

end
