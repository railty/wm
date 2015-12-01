class Product < ActiveRecord::Base
  validates 'Prod_Num', uniqueness: true
  self.primary_key = 'Prod_Num'
  belongs_to :barcode, foreign_key: "Prod_Num"

  # this is to take care of the non-null attributes
  def self.init_instance
    inst = self.new

    inst.Unit_Cost = 0
    inst.Last_Ord_Date = '2000-01-01'
    inst.On_Order = 0
    inst.Ord_Point = 0
    inst.isFood = 0

    return inst
  end
end
