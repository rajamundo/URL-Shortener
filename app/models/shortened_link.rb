class ShortenedLink < ActiveRecord::Base

  belongs_to :user
  before_save :generate_unique_identifier

  #validates :website_url, :presence => true

  private
    def generate_unique_identifier
      self.unique_identifier = SecureRandom.urlsafe_base64(8, false)
    end
end
