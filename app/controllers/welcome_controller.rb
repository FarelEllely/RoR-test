class WelcomeController < ApplicationController
  def index
    @message = "Latests News"
    @others = "Recents"
    #Display the most 3 recents articles
  	@articles = Article.all.order("created_at DESC").limit(3)
    #Display others news from each categories in thumbnails fashion
    @other_news = Article.includes([:category]).order("created_at DESC").all_except(@articles).limit(4)
  end

  def about
  end

  def contact
  end
end
