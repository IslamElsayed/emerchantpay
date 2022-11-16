# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validations
  validates :name, presence: true

  %w[merchant admin].each do |user_type|
    define_method("#{user_type}?") do
      type == user_type.classify
    end
  end
end
