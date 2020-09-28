class Dolist < ApplicationRecord
    validates :content, presence: true, length: { maximum: 255 }
    validates :status, presence: true, length: { maximum: 18 }
end
