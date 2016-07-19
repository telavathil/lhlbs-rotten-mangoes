class Actor < ApplicationRecord
    belongs_to :movie

    validates :firstname,
              presence: true

    validates :lastname,
              presence: true

    def full_name
        "#{firstname} #{lastname}"
    end
end
