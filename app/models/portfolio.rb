class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  # Custom scopes => see portfolio controller
  def self.angular
    where(subtitle: 'Angular')
  end

  scope :ruby_on_rails, -> { where(subtitle: "Ruby on Rails") }
  # above is two different ways of creating custom scopes
  # the last example is a lambda
end
