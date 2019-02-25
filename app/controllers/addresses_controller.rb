class AddressesController < ApplicationController
  def new
    @address = Address.new
    @user = User.find(params[:user_id])
  end

  def create
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

    private
  def addresse_params
    params.require(:addresses).permit(:postcode, :prefectures, :municipality, :street_number, :building_name, :room_number, :remarks, { :user_ids => [] })
  end
end
