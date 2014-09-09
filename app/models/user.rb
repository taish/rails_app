class User < ActiveRecord::Base
  has_many :twitter_users, dependent: :delete_all

  authenticates_with_sorcery!
  validates_confirmation_of :password
  validates_uniqueness_of   :email
  validates_presence_of     :email
end
