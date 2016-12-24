class WelcomeController < ApplicationController
  def index
  	@articles = Article.all.order("created_at DESC").limit(3)
  end

  def about
  end

  def contact
  end
end
