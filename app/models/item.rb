class Item < ApplicationRecord

  has_many :cart_items

  has_one_attached :image_id
  
  
  def get_profile_image(width, height)
    unless image_id.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image_id.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image_id.variant(resize_to_limit: [width, height]).processed
  end

end
