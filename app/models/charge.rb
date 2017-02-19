# == Schema Information
#
# Table name: charges
#
#  id          :integer          not null, primary key
#  charge_type :integer
#  price       :integer
#  payer       :integer
#  payee       :integer
#  paid_at     :date
#  note        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Charge < ApplicationRecord
  validates_presence_of :charge_type, :price, :payer ,:payee
  CHARGE_TYPE = [
    ["代付水費", 0, 4],
    ["代付電費", 1, 5],
    ["代付瓦斯", 2, 6],
    ["代付網路", 3, 7],
    ["水費"   , 4],
    ["電費"   , 5],
    ["瓦斯"   , 6],
    ["網路"   , 7],
  ]
  PAYER = [
    ["Kevin" ,0, 4],
    ["Can"   ,1, 5],
    ["Steven",2, 6],
  ]
  PAYEE = [
    ["中華"   , 0],
    ["瓦斯"   , 1],
    ["台電"   , 2],
    ["台水"   , 3],
    ["Kevin" , 4],
    ["Can"   , 5],
    ["Steven", 6]
  ]

  def pay
    update(paid_at: Time.now)
  end
  class << self
    def auto_generate_charge(charge)
      3.times do |i|
        Charge.create(
          charge_type: Charge::CHARGE_TYPE[charge.charge_type][2],
          payer: i,
          payee: Charge::PAYER[charge.payer][2],
          price: (charge.price / 3),
          paid_at: (charge.payer == i ? charge.paid_at : nil),
          note: '自動加入'
        )
      end
    end
  end
end
