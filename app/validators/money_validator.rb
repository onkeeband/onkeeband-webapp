class MoneyValidator < ActiveModel::EachValidator
  PRICE_REGEX = /^([1-9]\d{0,5}|0)(\.\d{2})?$/
  
  def validate_each(record, attribute, value)
    unless PRICE_REGEX =~ value.to_s
      record.errors[attribute] << (options[:message] || "must be a valid dollar value")
    end
  end
end