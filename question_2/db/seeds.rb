# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if User.table_exists?
  [
    { username: 'johndoe', first_name: 'John', last_name: 'Doe', email: 'test1@example.com' },
    { username: 'janedoe', first_name: 'Jane', last_name: 'Doe', email: 'test2@example.com' },
    { username: 'nanashi', first_name: 'Nanashino', last_name: 'Gonbee', email: 'test3@example.com' },
    { username: 'noname', first_name: 'No', last_name: 'Name', email: 'test4@example.com' },
    { username: 'tyamada', first_name: 'Taro', last_name: 'Yamada', email: 'test5@example.com' },
    { username: 'hyamada', first_name: 'Hanako', last_name: 'Yamada', email: 'test6@example.com' },
    { username: 'steve', first_name: 'Steve', last_name: 'Jobs', email: 'test7@example.com' },
    { username: 'gadd', first_name: 'Steve', last_name: 'Gadd', email: 'test8@example.com' },
    { username: 'linus', first_name: 'Linus', last_name: 'Torvalds', email: 'test9@example.com' },
    { username: 'ian', first_name: 'Ian', last_name: 'Murdock', email: 'test10@example.com' }
  ].each do |h|
    User.where(h).first_or_create!
  end
end

if Skilltag.table_exists?
  ['ruby', 'ruby-on-rails', 'linux', 'javascript', 'nginx', 'unicorn', 'jquery', 'memcached', 'amazon-web-services'].each do |n|
    Skilltag.where(name: n).first_or_create!
  end
end

if Publication.table_exists?
  10.times do |i|
    Publication.where(title: "テスト投稿 #{i}").first_or_create! url: "http://example.com/test_#{i}"
  end
end

if UserPublication.table_exists?
  users = User.where(id: 1..3).all

  users[0].publications << Publication.where(id: 1..3)
  users[1].publications << Publication.where(id: 4..6)
  users[2].publications << Publication.where(id: 7..10)
end

if UserSkilltag.table_exists?
  users = User.all.partition{|u| u.id % 2 == 0}

  users.first.each do |u|
    u.skilltags << Skilltag.where(name: %w(ruby ruby-on-rails))
  end
  users.last.each do |u|
    u.skilltags << Skilltag.where(name: %w(ruby javascript))
  end
end

if PublicationSkilltag.table_exists?
  publications = Publication.all.partition{|u| u.id % 2 == 0}

  publications.first.each do |pub|
    pub.skilltags << Skilltag.where(name: %w(ruby ruby-on-rails))
  end
  publications.last.each do |pub|
    pub.skilltags << Skilltag.where(name: %w(ruby javascript))
  end
end
