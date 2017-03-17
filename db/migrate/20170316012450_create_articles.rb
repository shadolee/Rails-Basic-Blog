class CreateArticles < ActiveRecord::Migration[5.0]
  def change # creates a method named change
    create_table :articles do |t| # t is for table
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
