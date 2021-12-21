FactoryBot.define do
  factory :article do
#        headline  { "Yabadabu" }
#        sub_headline  { "subsub" }
#        header_image  { "" }
     headline  { Faker::Quote.yoda }
     sub_headline  { Faker::Quote.yoda }
     header_image  { Faker::Internet.url }
  end
end
