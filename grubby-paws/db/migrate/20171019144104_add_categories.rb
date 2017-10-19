class AddCategories < ActiveRecord::Migration[5.1]
  def change
    Category.create(:name => 'Nigerian')
  end
end
