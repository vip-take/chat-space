class MessagesController < ApplicationController
  before_action :set_user_groups, only: [:index]
  before_action :set_group, only: [:index]

  include Groups

  def index ; end

  private
    def set_group
      @group = Group.find(params[:id])
    end
end
