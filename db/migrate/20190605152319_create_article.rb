class CreateArticle < ActiveRecord::Migration[5.1]
 
    def change 
      create_table :articles do |el|
        el.string :title
        el.string :content 
      end 
   
  end
end
