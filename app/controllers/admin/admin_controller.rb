class Admin::AdminController < ActionController::Base
  before_action :authenticate_admin!
  layout 'admin'

    def current_ability
    @current_ability ||= Ability.new(current_admin)
  end
end