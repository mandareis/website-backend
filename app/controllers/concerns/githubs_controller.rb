class GithubsController < ApplicationController
  before_action :check_auth, only: [:create, :update, :destroy]

  def index
    render json: Github.all
  end

  def show
    render json: Github.find(params[:id])
  end

  def create
    github = Github.create({
      "title" => params[:title],
      "url" => params[:url],
      "languages" => params[:languages],
      "date" => params[:date],
    })
    render json: github
  end

  def update
    render json: Github.where("id = ?", params[:id]).update(github_params)
  end

  def destroy
    gh = Github.find(params[:id])
    gh.destroy
    render json: gh
  end

  private

  def github_params
    params.require(:github).permit(:title, :url, :languages, :date)
  end
end
