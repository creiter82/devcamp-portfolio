module PortfoliosHelper

  def image_generator(height:, width:)
    "http://placehold.it/#{height}x#{width}"
  end

  def portfolio_img img, type
    if img.model.main_image? || img.model.thumb_image?
      img
    elsif type == 'thumb'
      image_generator(height: '350', width: '200')
    elsif type == 'main'
      image_generator(height: '600', width: '400')
    end
  end

  def portfolio_admin_links var, style = ''
    (link_to fa_icon("pencil #{style}"), edit_portfolio_path(var), class: 'warning' if logged_in?(:site_admin)) + " ".html_safe +
    (link_to fa_icon("trash #{style}"), var, class: 'danger', method: :delete, data: { confirm: "Are you sure you want to delete \'#{var.title}\'?" } if logged_in?(:site_admin))
  end

end
