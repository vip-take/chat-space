module Groups

  extend ActiveSupport::Concern

  private
    def set_user_has_groups
      @groups = current_user.groups
    end
end
