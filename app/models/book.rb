class Book < ApplicationRecord
	mount_uploader :image, AvatarUploader
	belongs_to :category

	def self.search(search)
 	 where("book_name LIKE ?" , "%#{search}%")
	end     

end
