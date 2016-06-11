class UrlsController < ApplicationController

  def index
  end

  def show
    @url = Url.find(params[:id])
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      @url.create_short_link
      flash[:notice] = 'Short link has been created'
      redirect_to @url
    else
      flash.now[:alert] = 'Original URL can\'t be blank' if @url.original.empty?
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def url_params
    params.require(:url).permit(:original, :short, :description)
  end
end