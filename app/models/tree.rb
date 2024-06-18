class Tree < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
  
    belongs_to :user
  
    validates :name, presence: true, length: { minimum: 4 }
    validate :at_least_one_field_filled_and_valid_length
  
    private
  
    def at_least_one_field_filled_and_valid_length
      if x.blank? && instagram.blank? && youtube.blank?
        errors.add(:base, "At least one of x, instagram, or youtube must be present")
      end
  
      if x.present? && x.length <= 5
        errors.add(:x, "must be more than 5 characters")
      end
  
      if instagram.present? && instagram.length <= 5
        errors.add(:instagram, "must be more than 5 characters")
      end
  
      if youtube.present? && youtube.length <= 5
        errors.add(:youtube, "must be more than 5 characters")
      end
    end
  end
  