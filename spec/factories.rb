Factory.define :person do |f|
  f.name { Forgery::Name.full_name }
  f.postcode {|a| a.association :postcode }
end
Factory.define :postcode do |f|
  f.number { Forgery::Basic.number(:at_most => 9999) }
end
