class Attendence < ApplicationRecord
  belongs_to :user
  belongs_to :standard
end
