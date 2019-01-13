class AddDescriptionToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :description, :text
    # pridėti stulpelį į articles db, stulp. pav - description, type = text
    add_column :articles, :create_at, :datetime
    add_column :articles, :updated_at, :datetime

  end
end
