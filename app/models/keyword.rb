class Keyword < ApplicationRecord
  belongs_to :channel
  validates :word, presence: true, uniqueness: true
  before_save :upcase_word

  protected

  def upcase_word
    self.word.upcase!
  end
end
