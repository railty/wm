class OhsPosProduct < ActiveRecord::Base
  establish_connection OHS_POS
  self.table_name = "Product"
  validates 'Prod_Num', uniqueness: true
  self.primary_key = 'Prod_Num'
  belongs_to :barcode, foreign_key: "Prod_Num"
end
