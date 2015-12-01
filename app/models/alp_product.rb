class AlpProduct < ActiveRecord::Base
  establish_connection ALP
  self.table_name = "Products"
  validates 'Prod_Num', uniqueness: true
  self.primary_key = 'Prod_Num'
  belongs_to :barcode, foreign_key: "Prod_Num"
end
