class RepliesController < ApplicationController
  def new
    @micropost = Micropost.find(params[:micropost_id])
    @replies = Reply.where(micropost_id: params[:micropost_id] )
    @new_reply = Reply.new(:micropost_id => params[:micropost_id], :topic_id => params[:topic_id])
  end

  def create
    Reply.create(reply_params)
    flash[:success] = "返信しました"
    redirect_to topic_url(params[:reply][:topic_id])
  end

  def destroy
    reply = Reply.find(params[:id])
    topic_id = reply.topic_id
    reply.destroy
    flash[:danger] = "返信を削除しました"
    redirect_to topic_url(topic_id)
  end

  private

  def reply_params
    params.require(:reply).permit(:reply, :topic_id, :micropost_id)
  end
end
