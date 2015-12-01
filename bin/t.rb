#result = Barcode.parseExcel('doc/tbl_POS_UpdateList_20151125110001.xls')
#result = Barcode.parseExcel('doc/WM Vegetable Frozen Item File_2015-03-27.xls')
Itemfile.destroy_all
result = Barcode.parseExcel('doc/Sample Item List Dry Grocery.xls')
debugger
puts result
