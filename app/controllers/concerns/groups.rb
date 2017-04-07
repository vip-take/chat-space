module Groups

  extend ActiveSupport::Concern

  private
    def set_user_groups
      @groups = current_user.groups
    end
end
