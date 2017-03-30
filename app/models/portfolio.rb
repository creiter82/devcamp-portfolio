class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs| attrs['name'].blank? }
  include Placeholder
  after_initialize :set_defaults
  validates_presence_of :title, :body, :main_image, :thumb_image

  # Custom scopes => see portfolio controller
  def self.angular
    where(subtitle: 'Angular')
  end

  scope :ruby_on_rails, -> { where(subtitle: "Ruby on Rails") }
  # above is two different ways of creating custom scopes
  # the last example is a lambda

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end
end
