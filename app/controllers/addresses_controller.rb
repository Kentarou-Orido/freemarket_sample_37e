class AddressesController < ApplicationController

  def new
    @address = Address.new
    @user = User.find(params[:user_id])
  end

  def create
    @address = Address.new(addresse_params)
    if @address.save
      redirect_to root_path, notice: "新規登録が完了しました！ようこそ！"
    else
      @user = User.find(params[:user_id])
      render :new
    end
  end

  private
  def addresse_params
    params.require(:address).permit(:postcode, :prefectures, :municipality, :street_number, :building_name, :room_number, :remarks).merge(user_id: params[:user_id])
  end
end
