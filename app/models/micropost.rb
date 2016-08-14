class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 140}

  
  mount_uploader :picture, AvatarUploader
  
  validates :picture,
            :file_size => {
                :maximum => 1.megabytes.to_i
            }
end
