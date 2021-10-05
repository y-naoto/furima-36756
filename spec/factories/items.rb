FactoryBot.define do
  factory :item do
    item_name     {'sample'}
    item_explanation  {'aaaaa'}
    category_id       {2}
    condition_id      {2}
    send_money_id     {2}
    todoufukenn_id    {2}
    delivery_day_id   {2}
    price             {11111}
    association :user
    
  end
end
