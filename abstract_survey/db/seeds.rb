# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'open-uri'
require 'yaml'


User.create!(:first_name => 'Shamsul', :last_name => 'Haque', :username => 'shamsul', :email => 'shamsulsham89@gmail.com',:password => 'shamsul',:password_confirmation => 'shamsul', :account_type_id => '1')
User.create!(:first_name => 'Ershad', :last_name => 'Nawaj', :username => 'ershad', :email => 'ershadnawazdxb@gmail.com',:password => 'shamsul',:password_confirmation => 'shamsul', :account_type_id => '2')



ACCOUNT_TYPE = ['Admin','Surveyor']
ACCOUNT_TYPE.each do |account_type|
   AccountType.create!(:name => account_type, :status => 1)
end

OUTLET_TYPE = ['Carrefour - MOE','Carrefour - DCC','Carrefour - Shindaga','Carrefour - MCC','Carrefour - Century Mall']
OUTLET_TYPE.each do |outlet_type|
   OutletType.create!(:name => outlet_type, :status => 1)
end

VISIBILITY_TYPE = ['Very low','Low','Average','Good','High']
VISIBILITY_TYPE.each do |visibility_type|
   VisibilityType.create!(:name => visibility_type, :status => 1)
end

STOCK_AVAILABILITY_TYPE = ['No stock at all','Little stock','Average stock','Full stock']
STOCK_AVAILABILITY_TYPE.each do |stock_availability_type|
   StockAvailabilityType.create!(:name => stock_availability_type, :status => 1)
end

RATE_THE_PRESENTABILITY_TYPE = ['Very ugly','Ugly','Average','Good','Very Good']
RATE_THE_PRESENTABILITY_TYPE.each do |rate_the_presentability_type|
   RateThePresentabilityType.create!(:name => rate_the_presentability_type, :status => 1)
end

RATE_THE_COMMUNICATION_SKILL_TYPE = ['Very poor','Poor','Average','Good','Very Good']
RATE_THE_COMMUNICATION_SKILL_TYPE.each do |rate_the_communication_skill_type|
   RateTheCommunicationSkillType.create!(:name => rate_the_communication_skill_type, :status => 1)
end

PRODUCT = ['Philips','Braun']
PRODUCT.each do |product|
   Product.create!(:name => product, :status => 1)
end