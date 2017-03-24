class Channel < ApplicationRecord
  has_many :keywords
  has_and_belongs_to_many :messages

  validates :name, presence: true, uniqueness: true

  before_save :upcase_name

  after_create :add_default_keyword

  protected

  def upcase_name
    self.name.upcase!
  end

  def add_default_keyword
    self.keywords.create(word: self.name)
  end
end
