class Api::V1::GuestsController < ApplicationController
  before_action :find_guest, only: [:show, :update, :destroy]

  def index
    @guests = Guests.all
    render json: @guests
  end

  def show
    render json: @guest
  end

  def create
    @guest = Guest.new(guest_params)
    if @guest.save
      render json: @guest
    else
      render error: {error: "Unable to create guest"}, status: 400
  end

  def update
    if @guest
      @guest.update(guest_params)
      render json: { message: "Guest successfully updated"}, status: 200
    else
      render json: { error: "Unable to update Guest"}, status: 400
    end
  end

  def destroy
    if @guest
      @guest.destroy
      render json: { message: "Guest successfully deleted"}, status: 200
    else
      render json: { error: "Unable to delete Guest"}, status: 400
    end
  end

  private

  def guest_params
    params.require(:guest).permit(:guest, :first_name, :last_name, :phone, :email)
  end

  def find_guest
    @guest = Guest.find(params[:id])
  end
end
