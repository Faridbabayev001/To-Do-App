class ShareController < ApplicationController
  layout "home"
  before_action :authenticate_user!

  def index
    @tasks = current_user.user_tasks.paginate(:page => params[:page], :per_page => 8)
  end
end
