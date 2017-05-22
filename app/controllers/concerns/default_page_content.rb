module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_filter :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Cameron Reiter | My Portfolio Website"
    @seo_keywords = "Cameron Reiter portfolio"
  end

end