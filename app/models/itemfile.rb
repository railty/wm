class Itemfile < ActiveRecord::Base
  self.table_name = "ItemFile"
  validates 'UPC_GTIN', uniqueness: true
  self.primary_key = 'UPC_GTIN'
  belongs_to :barcode, foreign_key: "UPC_GTIN"

end
