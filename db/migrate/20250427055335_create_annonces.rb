class CreateAnnonces < ActiveRecord::Migration[7.1]
  def change
    create_table :annonces do |t|
      t.string :titre
      t.text :description
      t.decimal :prix, precision: 10, scale: 2
      t.string :categorie
      t.string :localisation
      t.references :user, null: false, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
