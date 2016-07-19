class Actor < ApplicationRecord
    has_many :staredins
    has_many :movies, through: :staredins

    validates :firstname,
              presence: true

    validates :lastname,
              presence: true

    def full_name
        "#{firstname} #{lastname}"
    end
end
