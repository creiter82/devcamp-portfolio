class Portfolio < ApplicationRecord
  has_many :technologies, dependent: :destroy
  accepts_nested_attributes_for :technologies,
                                allow_destroy: true,
                                reject_if: lambda { |attrs| attrs['name'].blank? }

  validates_presence_of :title, :body

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  # Custom scopes => see portfolio controller
  def self.angular
    where(subtitle: 'Angular')
  end

  def self.by_position
    order(position: :asc)
  end

  scope :ruby_on_rails, -> { where(subtitle: "Ruby on Rails") }
  # above is two different ways of creating custom scopes
  # the last example is a lambda

end
