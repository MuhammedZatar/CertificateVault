class User < ApplicationRecord
  # Devise for authentication
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :certificates, dependent: :destroy
  has_many :apps, dependent: :destroy

  # Ensure correct role prioritization
  def is_admin?
    self[:is_admin] == true
  end

  def is_developer?
    self[:is_developer] == true && !is_admin?
  end

  # Default values for new users
  after_initialize :set_default_flags, if: :new_record?

  private

  def set_default_flags
    self.is_admin ||= false
    self.is_developer ||= false
  end
end
