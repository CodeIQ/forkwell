# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Publication.table_exists?
  10.times do |i|
    Publication.create! title: "テスト投稿 #{i}", url: "http://example.com/test_#{i}"
  end
end

if Concern.table_exists?
  Publication.all.each do |pub|
    count = rand 20
    count.times { pub.concerns.create! }
  end
end

if PublicationComment.table_exists?
  Publication.all.each do |pub|
    count = rand 10
    count.times { |i| pub.publication_comments.create! body: "テスト #{i}" }
  end
end
