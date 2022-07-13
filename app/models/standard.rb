class Standard < ApplicationRecord  
  has_many :user_standards
  has_many :users , through: :user_standards , dependent: :destroy
  has_many :attendences 
end
