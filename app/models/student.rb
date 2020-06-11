class Student < ApplicationRecord
  # validates :name, presence: true
  # validates :age, presence: true
  # validates :grade, presence: true
  validates_presence_of :name, :age, :grade 
end
