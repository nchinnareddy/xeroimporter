class Account < ActiveRecord::Base
  has_many :payments
  # attr_accessible :title, :body
end
