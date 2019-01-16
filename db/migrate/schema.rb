ActiveRecord::Schema.define(version: 20190110203326) do

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "content"
  end

  create_table "posts", force: :cascade do |t|
    t.string "name"
    t.string "content"
  end

end
