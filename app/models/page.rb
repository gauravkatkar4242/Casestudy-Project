class Page < ApplicationRecord
	belongs_to :casestudy

	validates :body, presence: true 
end
