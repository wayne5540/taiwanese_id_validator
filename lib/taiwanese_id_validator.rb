require "taiwanese_id_validator/twid_validator"

class TaiwaneseIdValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if skip_check?

    unless TwidValidator.valid?(value, case_sensitive?)
      record.errors[attribute] << (options[:message] || "is not an valid ID")
    end
  end

  private

  def skip_check?
    options[:allow_nil].present? || options[:allow_blank].present?
  end

  def case_sensitive?
    options[:case_sensitive].nil? ? true : options[:case_sensitive]
  end
end
