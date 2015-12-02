class Barcode < ActiveRecord::Base
  validates :id, uniqueness: true
  self.primary_key = 'id'
  #before_create :create_product

  has_one :product, foreign_key: "Prod_Num"
  has_one :price, foreign_key: "ProdNum"
  has_one :itemfile, foreign_key: "UPC_GTIN"
  #has_one :alp_product, foreign_key: "Prod_Num"

  def self.fieldlize(name)
      return name.gsub(/[^a-zA-Z\d]/, '_')
  end

  def self.loadData(data)
    ct_create = 0
    ct_update = 0
    data.each do |n1, v1|
      attrs = {}
      klss = []
      v1.each do |n2, v2|
        fd = fieldlize(v2['n'])
        if fd == 'UPC_GTIN' then
          klss = [{'class_name'=>'Itemfile', 'key'=>fd}]
        end
        if fd == 'Prod_Num' then
          klss = [{'class_name'=>'Product', 'key'=>fd}, {'class_name'=>'Price', 'key'=>'ProdNum'}]
        end
        attrs[fd] = v2['v']
      end


      klss.each do |kls|
        column_names = kls['class_name'].constantize.send 'column_names'


        attrs[kls['key']] = attrs[kls['key']].gsub(/[^\d]/, '')
        next if attrs[kls['key']] == ''

        klass = Object.const_get kls['class_name']
        inst = kls['class_name'].constantize.send(:find_by, {kls['key'] => attrs[kls['key']]})

        if (inst == nil) then
          inst = klass.new
          ct_create = ct_create + 1
        else
          ct_update = ct_update + 1
        end

        inst.update(attrs)
        inst.save

	barcode = Barcode.find_by({'id'=>attrs['UPC_GTIN']})
	if barcode ==nil then
		barcode = Barcode.new
		barcode.id= attrs['UPC_GTIN']
		barcode.save
	end 

      end


#      barcode = Barcode.find_by(id: attrs['UPC_GTIN'])
#      if barcode == nil then
#        barcode = Barcode.new
#        barcode.id = attrs['UPC_GTIN']
#        barcode.save
#      end
    end
    return {'created' => ct_create, 'updated' => ct_update}
  end

end
