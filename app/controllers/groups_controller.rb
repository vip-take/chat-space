class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]
  before_action :set_user_groups, only: [:index]
  before_action :set_all_users, only: [:new, :edit]

  include Groups

  def index ; end

  def new
    @group = Group.new
  end

  def edit ; end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:notice] = 'グループ作成成功'
      redirect_to root_path
    else
      flash.now[:alert] = 'グループ作成失敗'
      render :new
    end
  end

  def update
    if @group.update(group_params)
      flash[:notice] = 'グループの情報が更新されました'
      redirect_to root_path
    else
      flash.now[:alert] = 'グループ情報の更新に失敗しました'
      render :edit
    end
  end

  private
    def group_params
      params.require(:group).permit(:name, user_ids: [])
    end

    def set_group
       @group = Group.find(params[:id])
    end

    def set_all_users
      #@users = User.where.not(id: current_user.id).order_by_name
      @users = User.order_by_name
    end
end

