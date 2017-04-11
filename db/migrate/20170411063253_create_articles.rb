class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title   #creates title column
    
    end
  end
end
