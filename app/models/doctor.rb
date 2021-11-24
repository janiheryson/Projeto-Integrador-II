class Doctor < ApplicationRecord
  belongs_to :specialty

  validates :fullname, :email, :CRM, presence: true, uniqueness: true
end
