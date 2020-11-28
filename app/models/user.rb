class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :follower, class_name: 'Relationship', foreign_key: :follower_id, dependent: :destroy
  has_many :follower_user, through: :follower, source: :followed
  has_many :followed, class_name: 'Relationship', foreign_key: :followed_id, dependent: :destroy
  has_many :followed_user, through: :followed, source: :follower

  def following?(user)
    relationships.where(follower_id: user.id).exsits?
  end


  attachment :profile_image

  validates :name, presence: true,
                   length: { minimum: 2, maximum: 20 }
  validates :introduction, length: { maximum: 50 }
end
