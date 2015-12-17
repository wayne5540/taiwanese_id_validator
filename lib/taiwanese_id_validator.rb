require "taiwanese_id_validator/twid_validator"

class TaiwaneseIdValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless TwidValidator.valid?(value)
      record.errors[attribute] << (options[:message] || "is not an valid ID")
    end
  end
end
