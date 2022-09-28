# ユーザー作成
4.times do |n|
  User.create!(
    name: "春ショップ店員#{n + 1}",
    email: "spring#{n + 1}@test.com",
    password: "123456",
    image: File.open("./app/assets/images/spring#{n + 1}.png")
  )
end

2.times do |n|
  User.create!(
    name: "夏ショップ店員#{n + 1}",
    email: "summer#{n + 1}@test.com",
    password: "123456",
    image: File.open("./app/assets/images/summer#{n + 1}.png")
  )
end

2.times do |n|
  User.create!(
    name: "秋ショップ店員#{n + 1}",
    email: "autumn#{n + 1}@test.com",
    password: "123456",
    image: File.open("./app/assets/images/autumn#{n + 1}.png")
  )
end

2.times do |n|
  User.create!(
    name: "冬ショップ店員#{n + 1}",
    email: "winter#{n + 1}@test.com",
    password: "123456",
    image: File.open("./app/assets/images/winter#{n + 1}.png")
  )
end

User.create!(
  name: "ユーザー管理者",
  email: "admin@test.com",
  password: "123456",
  admin: true,
  image: File.open("./app/assets/images/admin.png")
)
# ショップ作成
Shop.create!(
  name: "春ショップ",
  owner_id: 1,
  image: File.open("./app/assets/images/spring_shop.png"),
  email: "spring@test.com",
  shop_url: "https://www.katekate.blog",
  telephone_number: "054-123-1234",
  post_code: "〒111-0000",
  address: "静岡県焼津市00-00",
  opening_date: "2022-01-01",
  business_start: "2022-01-01",
  content: "ハンドメイドショップ"
)

Shop.create!(
  name: "夏ショップ",
  owner_id: 5,
  image: File.open("./app/assets/images/summer_shop.png"),
  email: "summer@test.com",
  shop_url: "https://www.katekate.blog",
  telephone_number: "054-456-1234",
  post_code: "〒111-1111",
  address: "静岡県焼津市11-11",
  opening_date: "2021-01-01",
  business_start: "2021-01-01",
  content: "ハンドメイドショップ"
)

Shop.create!(
  name: "秋ショップ",
  owner_id: 7,
  image: File.open("./app/assets/images/autumn_shop.png"),
  email: "autumn@test.com",
  shop_url: "https://www.katekate.blog",
  telephone_number: "054-789-1234",
  post_code: "〒111-2222",
  address: "静岡県焼津市22-22",
  opening_date: "2020-01-01",
  business_start: "2020-01-01",
  content: "ハンドメイドショップ"
)

Shop.create!(
  name: "冬ショップ",
  owner_id: 9,
  image: File.open("./app/assets/images/winter_shop.png"),
  email: "winter@test.com",
  shop_url: "https://www.katekate.blog",
  telephone_number: "054-789-5678",
  post_code: "〒111-3333",
  address: "静岡県焼津市33-33",
  opening_date: "2020-11-11",
  business_start: "2020-11-11",
  content: "ハンドメイドショップ"
)

# ユーザーとショップの関連付け
Assign.create!(user_id: 1, shop_id: 1)
Assign.create!(user_id: 2, shop_id: 1)
Assign.create!(user_id: 3, shop_id: 1)
Assign.create!(user_id: 4, shop_id: 1)
Assign.create!(user_id: 5, shop_id: 2)
Assign.create!(user_id: 6, shop_id: 2)
Assign.create!(user_id: 7, shop_id: 3)
Assign.create!(user_id: 8, shop_id: 3)
Assign.create!(user_id: 9, shop_id: 4)
Assign.create!(user_id: 10, shop_id: 4)
Assign.create!(user_id: 11, shop_id: 1)

# 材料作成
Material.create!(
  shop_id: 1,
  image: File.open("./app/assets/images/material1.png")
  name: "生地 コットンツイル ブラック"
  purchase_price: 2790,
  purchase_number: 33000,
  purchase_date: "2022-09-15",
  per_price: 12,
  stock: 33000,
  remarks: "楽天で購入"
)

Material.create!(
  shop_id: 1,
  image: File.open("./app/assets/images/material2.png")
  name: "生地 ホルスタインアニマル柄 綿ツイル"
  purchase_price: 4260,
  purchase_number: 66000,
  purchase_date: "2022-08-26",
  per_price: 16,
  stock: 66000,
  remarks: "楽天で購入"
)

Material.create!(
  shop_id: 1,
  image: File.open("./app/assets/images/material2.png")
  name: "生地 ホルスタインアニマル柄 綿ツイル"
  purchase_price: 4260,
  purchase_number: 66000,
  purchase_date: "2022-08-26",
  per_price: 16,
  stock: 66000,
  remarks: "楽天で購入"
)

Material.create!(
  shop_id: 1,
  image: File.open("./app/assets/images/material3.png")
  name: "がま口 口金シルバー角型 10cm"
  purchase_price: 990,
  purchase_number: 9,
  purchase_date: "2022-08-25",
  per_price: 110,
  stock: 9,
  remarks: "セリアで購入"
)