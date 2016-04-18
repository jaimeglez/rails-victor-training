class WelcomeController < ApplicationController
  def index
  	if !current_admin.nil?
  		@admin= Admin.find(current_admin)
  	end
  end

  def current_ability
    @current_ability ||= Ability.new(current_admin)
  end
end
