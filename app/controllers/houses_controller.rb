class HousesController < ApplicationController
  def index
    @houses = House.all
  end

  def show
    @house = House.find(params["id"])
    @members = @house.members
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)

    if @house.save
      flash[:notice] = "House added successfully"
      redirect_to @house
    else
      flash.now[:error] = @house.errors.full_messages.to_sentence
      render :new
    end
  end

  private
    def house_params
      params.require("house").permit("name", "source", "author", "motto")
    end
end
