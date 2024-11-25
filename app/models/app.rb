class App < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :access_token, uniqueness: true

  before_create :generate_access_token

  private

  def generate_access_token
    self.access_token = SecureRandom.hex(32)
  end
end
