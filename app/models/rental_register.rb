# == Schema Information
#
# Table name: rental_registers
#
#  id               :integer          not null, primary key
#  phone_number     :string(255)
#  state            :integer          default(0), not null
#  token            :string(255)      not null
#  user_agent       :string(255)      not null
#  rental_finish_at :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_rental_registers_on_phone_number      (phone_number)
#  index_rental_registers_on_rental_finish_at  (rental_finish_at)
#  index_rental_registers_on_token             (token) UNIQUE
#  index_rental_registers_on_user_agent        (user_agent)
#

class RentalRegister < ActiveRecord::Base
end
