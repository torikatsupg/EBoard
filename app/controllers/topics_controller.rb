class TopicsController < ApplicationController
  def index
    @new_topic = Topic.new
    @topics = Topic.search(params[:search]).paginate(page: params[:page], per_page:10)
    @is_search = false
    if params[:search]
      @is_search = true
    end
  end

  def create
    Topic.create(topic_params)
    flash[:success] = "トピックを作成しました"
    redirect_to root_url
  end

  def destroy
    Topic.find(params[:id]).destroy
    Micropost.where(topic_id: params[:id]).destroy_all
    Reply.where(topic_id: params[:id]).destroy_all
    flash[:danger] = "トピックを削除しました"
    redirect_to root_url
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.title = params[:topic][:title]
    @topic.save
    flash[:success] = "トピックを更新しました"
    redirect_to root_url
  end

  def show
    @topic = Topic.find(params[:id])
    @microposts = Micropost.where(topic_id: params[:id])
    @replies = Reply.where(topic_id: params[:id])
    @new_micropost = Micropost.new(:topic_id => params[:id])
  end

  def reset
    params[:search] = nil
    redirect_to root_url
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end
end
