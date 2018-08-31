class UpvotesController < ApplicationController
  def create
    @upvote = Upvote.new(secure_params)
    @upvote.post = Post.find(params[:post_id])
    if @upvote.save
      redirect_to @upvote.post 
    else  
      redirect_to posts_url, notice: 'Cannot upvote the same post more than once.' 
    end
  end

  private
    def secure_params
      params.permit(:user_id, :post_id)
    end
end