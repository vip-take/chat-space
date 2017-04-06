class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:notice] = 'グループ作成失敗'
      redirect_to root_path, notice: 'グループが作成されました'
    else
      flash.now[:alert] = 'グループ作成失敗'
      render :new
    end
  end

  private
    def group_params
      params.require(:group).permit(:name)
    end

end
