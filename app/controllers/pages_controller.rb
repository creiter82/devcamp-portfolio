class PagesController < ApplicationController
  def home
  end

  def about
    @skills = Skill.all
    @page_title = "About me | Cameron Reiter"
  end

  def contact
    @page_title = "Contact | Cameron Reiter"
  end

  def tech_news
    @tweets = SocialTool.twitter_search
  end

end
