class Park < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  has_many :posts, dependent: :destroy

  has_many :park_equipments, dependent: :destroy
  has_many :equipments, through: :park_equipments

  has_many :park_facilities, dependent: :destroy
  has_many :facilities, through: :park_facilities
  
  has_many :park_age_groups, dependent: :destroy
  has_many :age_groups, through: :park_age_groups

  validates :park_name, presence: true
  validates :introduction, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image_square.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

end
