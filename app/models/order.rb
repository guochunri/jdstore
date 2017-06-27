class Order < ApplicationRecord
  before_create :generate_token
  belongs_to :user

  validates :billing_name, presence: true
  validates :billing_address, presence: true
  validates :shipping_name, presence: true
  validates :shipping_address, presence: true

  has_many :product_lists

  def generate_token
    self.token = SecureRandom.uuid
  end

#修改 model 设定 order 付款完成与付款方式纪录的method

  def set_payment_with!(method)
   self.update_columns(payment_method: method )
  end

  def pay!
   self.update_columns(is_paid: true )
  end

end
