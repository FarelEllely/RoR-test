class LikeController < ApplicationController
  def index
    @user = current_user
    @articles = Article.all
  end

  def create
    @article = Article.find(params[:id])
    Like.create(:article_id => @article, :user_id => current_user.id)
    end
  end

  def destroy
    @article = Article.find(params[:id])
    like = Like.find(params[:id])
    like.destroy
  end

  def like_params
    params.require(:like).permit(:user_id, :article_id)
  end
end
