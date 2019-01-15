class RenameCreatedAtArticlesName < ActiveRecord::Migration[5.1]
  def change
    rename_column :articles, :create_at, :created_at
  end
end
