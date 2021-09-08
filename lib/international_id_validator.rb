require "international_id_validator/itid_validator"

class InternationalIdValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if skip_check?

    unless ItidValidator.valid?(value, case_sensitive?, allow_old?)
      record.errors.add(attribute, (options[:message] || "is not a valid ID"))
    end
  end

  private

  def skip_check?
    options[:allow_nil].present? || options[:allow_blank].present?
  end

  def case_sensitive?
    options[:case_sensitive].nil? ? true : options[:case_sensitive]
  end

  def allow_old?
    options[:allow_old].nil? ? false : options[:allow_old]
  end
end
