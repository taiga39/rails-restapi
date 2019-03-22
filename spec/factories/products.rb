FactoryBot.define do

  factory :product, class: Product do
    title              {"title"}
    body               {"body"}
    image              {"imageurl"}
    price              {1500}
  end
end
