require 'taiwanese_id_validator/twid_mapping'

module TwidValidator
  def self.valid?(twid, case_sensitive = true)
    return false if !twid

    twid = twid.upcase unless case_sensitive

    return false if twid.length != 10
    return false if !( /[A-Z](1|2)\d{8}\z/ =~ twid )

    characters = twid.chars
    digits = TwidMapping::TWID_LETTER[characters.shift] + characters.map(&:to_i)

    weighted_sum = calculate_weighted_sum(digits)

    return weighted_sum % 10 == 0
  end

  private

  def self.calculate_weighted_sum(digits)
    sum = 0
    11.times do |i|
      m = digits[i] * TwidMapping::MULTIPLIER[i]
      sum += m
    end
    sum
  end
end