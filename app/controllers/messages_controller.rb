class MessagesController < ApplicationController
  before_action :set_user_groups, only: [:index]
  before_action :set_group, only: [:index]
  before_action :set_messages, only: [:index]

  include Groups

  def index
    @message = Message.new
  end

  def create
    @message = Message.new(create_params)
    if @message.save
      flash[:notice] = 'メッセージを送りました'
    else
      flash[:alert] = "メッセージの送信に失敗しました。"
      @message.errors.full_messages.each do |msg|
        flash[:alert] << msg
      end
    end
    redirect_to messages_path(params[:id])
  end

  private
    def create_params
      params.require(:message).permit(:comment).merge(user_id: current_user.id, group_id: params[:id])
    end

    def set_group
      @group = Group.find(params[:id])
    end

    def set_messages
      @messages = Group.find(params[:id]).messages.includes(:user).references(:user)
    end
end
