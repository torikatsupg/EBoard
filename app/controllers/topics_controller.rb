class TopicsController < ApplicationController
  def index
    @new_topic = Topic.new
    @topics = Topic.all
  end

  def create
    Topic.create(topic_params)
    redirect_to root_url
  end

  def destroy
    Topic.find(params[:id]).destroy
    redirect_to root_url
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.title = params[:topic][:title]
    @topic.save
    redirect_to root_url
  end

  def show
    @topic = Topic.find(params[:id])
    @microposts = Micropost.where(topic_id: params[:id])
    @new_micropost = Micropost.new(:topic_id => params[:id])
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end
end
