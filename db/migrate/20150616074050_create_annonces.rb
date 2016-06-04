class CreateAnnonces < ActiveRecord::Migration
  def change
    create_table :annonces do |t|
      t.string :categorie
      t.string :titre
      t.string :code_postal
      t.string :adresse
      t.date :dispo
      t.string :quantite
      t.string :commentaire
      t.string :img
      t.boolean :don
     
      t.timestamps null: false
    end
  end
end
