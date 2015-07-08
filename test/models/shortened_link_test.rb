require 'test_helper'

class ShortenedLinkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
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
