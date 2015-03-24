class Post < ActiveRecord::Base
	# scope :ordered_by_title,
	# scope :ordered_by_reverse_created_at,


	has_many :comments
	belongs_to :user

	# default_scope { order('created_at DESC') }
	# scope :ordered_by_title, (post, title) { |post| post.title.order}

end
