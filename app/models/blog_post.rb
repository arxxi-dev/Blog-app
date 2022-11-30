class BlogPost < ApplicationRecord
	belongs_to :blog_category
	has_many :comments, dependent: :destroy

	scope :visibility, lambda { |state| where("visibility_state = ?", state) }

	enum visibility_state: [:visible, :hidden]
end
