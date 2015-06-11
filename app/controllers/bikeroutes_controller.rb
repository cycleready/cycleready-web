class BikeroutesController < ApplicationController
  def index
    @bikeroutes = Bikeroute.all
  end

  def show
    @bikeroute = Bikeroute.find(params[:id])
  end

  def new
    @bikeroute = Bikeroute.new
  end

  def edit
    @bikeroute = Bikeroute.find(params[:id])
  end

  def create
    @bikeroute = Bikeroute.new(bikeroute_params)

    if @bikeroute.save
      redirect_to @bikeroute
    else
      render 'new'
    end
  end

  def update
    @bikeroute = Bikeroute.find(params[:id])

    if @bikeroute.update(bikeroute_params)
      redirect_to @bikeroute
    else
      render 'edit'
    end
  end

  private
    def bikeroute_params
      params.require(:bikeroute).permit(:title, :text)
    end

end
