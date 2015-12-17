require 'taiwanese_id_validator/twid_mapping'

module TwidGenerator
  # TODO: Refactor this method first!
  def self.generate(gender = nil)
    sum = 0
    twid = ""

    first_letter = TwidMapping::TWID_LETTER.keys.sample

    sum += TwidMapping::TWID_LETTER[first_letter][0] * TwidMapping::MULTIPLIER[0]
    sum += TwidMapping::TWID_LETTER[first_letter][1] * TwidMapping::MULTIPLIER[1]


    twid += first_letter.to_s

    case gender
    when "male"
      second_letter = 1
    when "female"
      second_letter = 2
    else
      second_letter = [1, 2].sample
    end
    sum += second_letter * TwidMapping::MULTIPLIER[2]
    twid += second_letter.to_s

    6.times do |i|
      letter = Random.rand(1..9)
      sum += letter * TwidMapping::MULTIPLIER[i + 3]
      twid += letter.to_s
    end

    if sum % 10 == 0
      last_two_letter = Random.rand(1..9)
      sum += last_two_letter
      twid += last_two_letter.to_s

      last_letter = 10 - last_two_letter
      sum += last_letter
      twid += last_letter.to_s
    elsif sum % 10 == 9
      last_two_letter = Random.rand(2..10)
      sum += last_two_letter
      twid += last_two_letter.to_s

      last_letter = 11 - last_two_letter
      sum += last_letter
      twid += last_letter.to_s
    else
      max_range = 10 - (sum % 10) - 1
      last_two_letter = Random.rand(1..max_range)
      sum += last_two_letter
      twid += last_two_letter.to_s

      last_letter = max_range + 1 - last_two_letter
      sum += last_letter
      twid += last_letter.to_s
    end

    return twid
  end
end