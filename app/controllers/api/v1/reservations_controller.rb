class Api::V1::ReservationsController < ApplicationController
    before_action :find_reservation, only: [:show, :update, :destroy]
  
    def index
      @reservations = Reservations.all
      render json: @reservations
    end
  
    def show
      render json: @reservation
    end
  
    def create
      @reservation = Reservation.new(reservation_params)
      if @reservation.save
        render json: @reservation
      else
        render error: {error: "Unable to create reservation"}, status: 400
    end
  
    def update
      if @reservation
        @reservation.update(reservation_params)
        render json: { message: "reservation successfully updated"}, status: 200
      else
        render json: { error: "Unable to update reservation"}, status: 400
      end
    end
  
    def destroy
      if @reservation
        @reservation.destroy
        render json: { message: "reservation successfully deleted"}, status: 200
      else
        render json: { error: "Unable to delete reservation"}, status: 400
      end
    end
  
    private
  
    def reservation_params
      params.require(:reservation).permit(:reservation, :code, :start_date, :end_date, :nights, :total_guests, :adults, :children, :infants, :status, :currency, :payout_price, :security_price, :total_price)
    end
  
    def find_reservation
      @reservation = Reservation.find(params[:id])
    end
end
