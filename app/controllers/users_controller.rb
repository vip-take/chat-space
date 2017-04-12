class UsersController < ApplicationController

  def search
    search_text = params[:user][:name]
    @users = User.with_name(search_text).order_by_name_without(current_user.id)
    if @users.present?
      render json: @users
    else
      render json: {error: 'no match'}, status: :not_found
    end
  end

end
