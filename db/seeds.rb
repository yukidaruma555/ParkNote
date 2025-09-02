# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


%w[すべり台 ブランコ 砂場 鉄棒 ジャングルジム うんてい シーソー 平均台 
クライミング遊具 コンビネーション遊具 ターザンロープ 乳幼児用遊具 その他].each do |name|
  Equipment.find_or_create_by!(name: name)
end

%w[洋式トイレ 和式トイレ 多機能トイレ おむつ交換代 手洗い場 ベンチ 屋根付き休憩所 駐車場].each do |name|
  Facility.find_or_create_by!(name: name)
end

%w[乳幼児(0-2) 幼児(3-5) 小学生].each do |name|
  AgeGroup.find_or_create_by!(name: name)
end