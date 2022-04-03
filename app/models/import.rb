class Import < ApplicationRecord
  has_one_attached :file
  after_create :set_status

  def set_status
    # setting status active to all new imports
    self.update(status: :active)
  end

  def type_list
    # list with imports types
    [:merchant, :shopper, :order]
  end
end
