class CreateBarcodes < ActiveRecord::Migration
  def change
    create_table :barcodes, id: false, primary_key: :id do |t|
      t.string :id, limit: 16, null: false
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE barcodes ADD PRIMARY KEY (id);
        SQL
      end

      dir.down do
      end
    end

  end
end
