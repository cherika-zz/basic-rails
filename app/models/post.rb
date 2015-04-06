class Post < ActiveRecord::Base
	# scope :ordered_by_title,
	# scope :ordered_by_reverse_created_at,


	has_many :comments
	belongs_to :user
	belongs_to :topic

	default_scope { order('created_at DESC') }
	# scope :ordered_by_title, (post, title) { |post| post.title.order}

	validates :title, length: {minimum: 5}, presence: true
	validates :body, length: {minimum: 20}, presence: true
	validates :topic_id, presence: true
	validates :user, presence: true 

end
