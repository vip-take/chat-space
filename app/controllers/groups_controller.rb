class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]
  before_action :set_group_members, only: [:edit]
  before_action :set_user_has_groups, only: [:index]

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
      redirect_to groups_path
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

    def set_group_members
      @users = @group.users.order_by_name_without(current_user.id)
    end
end

