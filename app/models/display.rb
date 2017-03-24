class Display < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :show_limit, presence: true
  validates :columns, presence: true

  before_save :upcase_name

  protected
  def upcase_name
    self.name.upcase!
  end
end