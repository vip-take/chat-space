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
      respond_to do |format|
        format.html{
          flash[:notice] = 'メッセージを送りました'
          redirect_to messages_path(params[:id])
        }
        format.json{
          render json: {
            name: @message.user.name,
            comment: @message.comment,
            image: @message.image,
            created_at: @message.created_time
          }
        }
      end
    else
      respond_to do |format|
        format.html{
          flash[:alert] = "メッセージの送信に失敗しました。"
          @message.errors.full_messages.each do |msg|
            flash[:alert] << msg
          end
        }
        format.json{
          render json: @message.errors, status: :unprocessable_entity
        }
      end
    end
  end

  private
    def create_params
      params.require(:message).permit(:comment, :image).merge(user_id: current_user.id, group_id: params[:id])
    end

    def set_group
      @group = Group.find(params[:id])
    end

    def set_messages
      @messages = Group.find(params[:id]).messages.includes(:user).references(:user)
    end
end
