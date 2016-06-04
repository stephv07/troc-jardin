class AddPartNumberToAnnonces < ActiveRecord::Migration
  def change
    add_column :annonces, :ville, :string
  end
end
