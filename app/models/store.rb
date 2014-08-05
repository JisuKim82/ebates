class Store < ActiveRecord::Base
  before_save :set_keywords

  scope :search, ->(keyword){where('keywords LIKE ?', "%#{keyword.downcase}%") if keyword.present?}

  protected
    def set_keywords
      self.keywords = [name, cash_back].map(&:downcase).join(' ')
    end
end
