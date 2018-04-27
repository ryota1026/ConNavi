class RepliesController < ApplicationController
  before_action :authenticate_user

  def create
    @reply = Reply.new(user_id: @current_user.id,
                     reply_id: params[:reply_id],
                     reply: params[:reply])
    @reply.save
    redirect_to("/posts/#{params[:post_id]}")
  end

  def destroy
    @reply = Reply.find_by(user_id: @current_user.id,
                         reply_id: params[:reply_id],
                         reply: params[:reply])
    @reply.destroy
    redirect_to("/posts/#{params[:post_id]}")
  end
end