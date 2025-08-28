class Park < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  has_many :posts, dependent: :destroy

  def get_image
    unless image.attached?
      faile_path = Rails.root.join('app/assets/image/no_image_square.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

end
