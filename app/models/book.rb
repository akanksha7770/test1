class Book < ApplicationRecord
	mount_uploader :image, AvatarUploader
	belongs_to :category
  belongs_to :user
	def self.search(search)
 	 	where("lower(book_name) LIKE ?" , "%#{search}%".downcase)
	end     

end
