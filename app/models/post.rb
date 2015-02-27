class Post < ActiveRecord::Base
	has_attached_file :picture
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  belongs_to :user

  validates :title, length: { minimum: 2 }, presence: true

end
