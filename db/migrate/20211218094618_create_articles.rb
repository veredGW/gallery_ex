class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :headline
      t.string :sub_headline
      t.string :header_image

      t.timestamps
    end
  end
end
