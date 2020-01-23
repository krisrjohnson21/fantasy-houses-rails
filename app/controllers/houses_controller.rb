class HousesController < ApplicationController
  def index
    @houses = House.order("name")
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

  def edit
    @house = House.find(params["id"])
  end

  def update
    @house = House.find(params["id"])
    @house.update(house_params)

    if @house.save
      flash[:notice] = "House updated successfully"
      redirect_to @house
    else
      flash.now[:error] = @house.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @house = House.find(params["id"])
    @house.members.destroy
    @house.destroy
    flash[:notice] = "House deleted successfully"
    redirect_to houses_path
  end

  private
    def house_params
      params.require("house").permit("name", "source", "author", "motto")
    end
end
