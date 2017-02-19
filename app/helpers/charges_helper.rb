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

module ChargesHelper
end
