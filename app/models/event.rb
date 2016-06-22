class Event < ActiveRecord::Base
	belongs_to :user
	has_many :invites
	has_many :products
end
