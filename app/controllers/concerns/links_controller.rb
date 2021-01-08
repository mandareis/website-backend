class LinksController < ApplicationController
  before_action :check_auth, only: [:create, :update, :destroy]

  def index
    render json: Link.all
  end

  def show
    render json: Link.find(params[:id])
  end

  def create
    link = Link.create({
      "topic" => params[:topic],
      "url" => params[:url],
      "date" => params[:date],
    })
    render json: link
  end

  def update
    render json: Github.where("id = ?", params[:id]).update(link_params)
  end

  def destroy
    link = Link.find(params[:id])
    link.destroy
    render json: link
  end

  private

  def link_params
    params.require(:link).pemrit(:topic, :url, :date)
  end
end
