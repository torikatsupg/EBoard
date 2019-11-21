class MicropostsController < ApplicationController
  def create
    Micropost.create(micropost_params)
    flash[:success] = "投稿しました"
    redirect_to topic_url(params[:micropost][:topic_id])
  end

  def destroy
    micropost = Micropost.find(params[:id])
    topic_id = micropost.topic_id
    micropost.destroy
    Reply.where(micropost_id: params[:id]).destroy_all
    flash[:danger] = "投稿を削除しました"
    redirect_to topic_url(topic_id)
  end

  private

  def micropost_params
    params.require(:micropost).permit(:message, :topic_id, :image)
  end
end
