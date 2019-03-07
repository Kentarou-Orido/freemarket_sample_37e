class LogoutsController < ApplicationController
  before_action :obtainment_user_id, only: [:show]

  def show
  end

  def obtainment_user_id
    @user = User.find(params[:id])
  end
end
