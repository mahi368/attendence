class User < ApplicationRecord
  require 'csv'
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :user_standards
  has_many :standards , through: :user_standards
  has_many :attendences

  def role?
    if self.has_role? :Faculty
      return "Faculty"
    else
      return "Student"
    end
  end

  def self.to_csv
    attributes = %w{enrollment_number email first_name last_name user_name}
    
    CSV.generate(headers: true) do |csv|
      
      csv << attributes

      all.each do |student|
        row = student.attributes.values_at(*attributes)
        row << student.attendences.count
        csv << row
      end
    end
  end
end
