class ShortenedLink < ActiveRecord::Base

  belongs_to :user
  before_create :generate_unique_identifier

  before_validation :generate_correct_url, if: :website_url?

  validates :website_url, presence: true
  validates :website_url, :url => true

  def to_param
    return self.unique_identifier
  end

  private
    def generate_unique_identifier
      self.unique_identifier = SecureRandom.urlsafe_base64(4, false)
    end

    def generate_correct_url
      unless self.website_url =~ /^https?:\/\//
        self.website_url = "http://" + self.website_url
      end
    end
end

# == Schema Information
#
# Table name: shortened_links
#
#  id                :integer          not null, primary key
#  website_url       :text
#  unique_identifier :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#
