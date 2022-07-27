class ReservationsController < ApplicationController
  def index
    @shop = Shop.find(params[:shop_id])
    @reservations = Reservation.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
  end

   def new
     @shop = Shop.find(params[:shop_id])
    @reservation = Reservation.new
   
    @day = params[:day]
    @time = params[:time]
    @start_time = DateTime.parse(@day + " " + @time + " " + "JST")
    message = Reservation.check_reservation_day(@day.to_date)
    
    
  end

  

  def create
    @shop = Shop.find(params[:shop_id])
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to root_path 
    else
      render :new
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  private
  def reservation_params
    params.require(:reservation).permit(:day, :time, :start_time,:shop_id, :user_id).merge(user_id: current_user.id, shop_id: params[:shop_id])
  end
end
