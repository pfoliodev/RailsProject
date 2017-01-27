class RenameCategoryNameToTitle < ActiveRecord::Migration[5.0]
  def change
    change_table :categories do |t|
      t.rename :name, :title
  end
end 
end
