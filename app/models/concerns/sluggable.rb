module Sluggable

extend ActiveSupport::Concern

included do
  before_validation :set_default_slug, on: [:create, :update], if:'!slug.nil?'

  private

  def set_default_slug
  	if !self.title.nil? && !self.title.empty? && (self.slug.nil? || self.slug.empty?)
  	self.slug = title.parameterize
  end
  end
end

end
