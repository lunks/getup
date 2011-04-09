class Person < ActiveRecord::Base
  belongs_to :postcode
  class << self
    def with_postcode(numbers)
      joins(:postcode).where(:postcodes => {:number => numbers})
    end
    def with_email(string)
      formatted_string = '%%%{email}' % {:email => string}
      Person.where('email LIKE ?', formatted_string)
    end
    def without_email(string)
      formatted_string = '%%%{email}' % {:email => string}
      Person.where('email NOT LIKE ?', formatted_string)
    end
    def without_postcode(numbers)
      joins(:postcode).where('postcodes.number NOT IN (?)', numbers)
    end
  end
end
