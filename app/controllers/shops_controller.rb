class ShopsController < ApplicationController

  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
# newページで入力した内容が格納された状態のインスタンスが飛んでくる
# user_idカラムにcurrent_userのidを代入する
  if @shop.save
    redirect_to shops_path
  else
    render 'new'
  end

  end

  private
  def shop_params
    params.require(:shop).permit(:name, :text)
  end

end
