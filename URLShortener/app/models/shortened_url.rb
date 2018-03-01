# == Schema Information
#
# Table name: shortened_urls
#
#  id         :integer          not null, primary key
#  long_url   :string
#  short_url  :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class ShortenedUrl < ApplicationRecord

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  def self.create_shortened_url(user, long_url)
    shortened_url = ShortenedUrl.random_code
    ShortenedUrl.create(user_id: user.id, long_url: long_url, short_url: shortened_url)
  end

  def self.random_code
    var = SecureRandom::urlsafe_base64(16)
    while ShortenedUrl.exist?(short_url: var)
      var = SecureRandom::urlsafe_base64(16)
    end
    var
  end
end
