class BikeroutesController < ApplicationController
  require 'dotenv'

  def index
    @bikeroutes = Bikeroute.all
  end

  def show
    @bikeroute = Bikeroute.find(params[:id])
    @mapbox_account = ENV['MAPBOX_ACCOUNT']
    @mapbox_apikey = ENV['MAPBOX_KEY']
  end

  def new
    #@bikeroute = Bikeroute.new
  end

  def edit
    #@bikeroute = Bikeroute.find(params[:id])
  end

  def create
    # @bikeroute = Bikeroute.new(bikeroute_params)
    #
    # if @bikeroute.save
    #   redirect_to @bikeroute
    # else
    #   render 'new'
    # end
  end

  def update
    # @bikeroute = Bikeroute.find(params[:id])
    #
    # if @bikeroute.update(bikeroute_params)
    #   redirect_to @bikeroute
    # else
    #   render 'edit'
    # end
  end

  def destroy
    # @bikeroute = Bikeroute.find(params[:id])
    # @bikeroute.destroy
    #
    # redirect_to bikeroutes_path
  end

  private
  def bikeroute_params
    params.require(:bikeroute).permit(:name, :description)
  end

end
