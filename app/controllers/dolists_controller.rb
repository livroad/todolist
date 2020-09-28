class DolistsController < ApplicationController
  before_action :set_dolist, only: [:show, :edit, :update, :destroy]
  
  
  def index
    @dolists = Dolist.order(id: :desc).page(params[:page]).per(24)
  end

  def show
  end

  def new
    @dolist = Dolist.new
  end

  def create
    @dolist = Dolist.new(dolist_params)
      
      if @dolist.save
        flash[:success] = 'Taskが正常に投稿されました'
        redirect_to @dolist
      else
        flash.now[:danger] = 'Taskが投稿されませんでした'
        render :new
      end
  end

  def edit
  end

  def update

    if @dolist.update(dolist_params)
      flash[:success] = 'Task は正常に更新されました'
      redirect_to @dolist
    else
      flash.now[:danger] = 'Task は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @dolist.destroy

    flash[:success] = 'Task は正常に削除されました'
    redirect_to tasks_url
  end
  
  private

  # Strong Parameter
  
  def set_dolist
    @dolist = Dolist.find(params[:id])
  end
  
  
  def dolist_params
    params.require(:dolist).permit(:content, :status)
  end
end
