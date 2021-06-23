class Secret < ActiveRecord::Base
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  belongs_to :user
end
