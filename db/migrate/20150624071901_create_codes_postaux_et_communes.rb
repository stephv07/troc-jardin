class CreateCodesPostauxEtCommunes < ActiveRecord::Migration
  def change
    create_table :codes_postaux_et_communes do |t|
      t.string :NomMinPoste
      t.string :CodePostal
    end
  end
end
