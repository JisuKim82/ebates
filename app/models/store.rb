class Store < ActiveRecord::Base
  before_save :set_keywords

  scope :search, ->(keyword){
    if keyword.present?
      where('keywords LIKE ?', "%#{keyword.downcase}%")
    else
      all
    end 
  }

  protected
    def set_keywords
      self.keywords = [name, cash_back].map(&:downcase).join(' ')
    end
end
