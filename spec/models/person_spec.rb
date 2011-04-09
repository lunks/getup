require 'spec/spec_helper'

describe Person do
  it { should belong_to(:postcode) }

  context 'searching for postcodes' do
    it 'should fetch records given a single postcode' do
      person = Factory(:person, :postcode => Factory(:postcode, :number => 2000))
      Person.with_postcode(2000).should include person
    end
    it 'should fetch records given multiple postcodes' do
      3.times { Factory :person }
      postcode = Postcode.find(1,2)
      Person.with_postcode([postcode[0].number, postcode[1].number]).count.should == 2
    end
  end

  context 'searching for email addresses' do
    let!(:person) {Factory :person, :email => 'pedro@hotmail.com'}
    it 'should fetch records given an email domain' do
      email_domain = 'hotmail.com'
      Person.with_email(email_domain).should include person
    end
  end
end
