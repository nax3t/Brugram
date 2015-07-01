class AddPublicToPhotos < ActiveRecord::Migration
  def change
  	add_column :photos, :public, :boolean
  end
end
