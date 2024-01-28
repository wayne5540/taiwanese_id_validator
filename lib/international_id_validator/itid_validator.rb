require 'international_id_validator/itid_mapping'

module ItidValidator
  def self.valid?(itid, case_sensitive = true, allow_old = false)
    return false if !itid
    return false if !itid.is_a?(String)

    itid = itid.upcase unless case_sensitive

    return false if itid.length != 10
    return true if allow_old && itid.match?(/\A[A-Z][ABCD]\d{8}\z/)
    return false unless itid.match?(/[A-Z](8|9)\d{8}\z/)

    characters = itid.chars
    digits = ItidMapping::ITID_LETTER[characters.shift] + characters.map(&:to_i)

    checked_num = calculate_checked_num(digits)

    return checked_num == digits.last
  end

  private

  def self.calculate_checked_num(digits)
    sum = 0
    10.times do |i|
      m = digits[i] * ItidMapping::MULTIPLIER[i]
      sum += (m % 10)
    end
    10 - (sum % 10)
  end
end
