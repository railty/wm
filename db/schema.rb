# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151119145106) do

  create_table "CountryCode", primary_key: "COUNTRY_CODE", force: true do |t|
    t.string "COUNTRY_NAME",  limit: 32
    t.string "OFFICIAL_NAME", limit: 64
  end

  create_table "barcodes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "itemfile", primary_key: "UPC_GTIN", force: true do |t|
    t.string   "UPC_CK_Digit",                         limit: 1
    t.string   "Supplier_Stock_Number",                limit: 15
    t.string   "Item_Description_1",                   limit: 20
    t.string   "French_Item_Description_1",            limit: 20
    t.string   "Shelf_1___Color",                      limit: 6
    t.string   "French_Shelf_1___Color",               limit: 6
    t.string   "Shelf_2___Size",                       limit: 6
    t.string   "French_Shelf_2___Size",                limit: 6
    t.string   "Unit_Size_UOM",                        limit: 10
    t.string   "Unit_Size_Sell_Qty",                   limit: 10
    t.string   "Item_Description_2",                   limit: 20
    t.string   "French_Item_Description_2",            limit: 20
    t.string   "UPC_Description",                      limit: 12
    t.string   "French_UPC_Description",               limit: 12
    t.string   "Signing_Desc",                         limit: 40
    t.string   "French_Signing_Desc",                  limit: 40
    t.string   "Brand",                                limit: 40
    t.string   "Shop___Ticket_Description",            limit: 20
    t.string   "French_Shop___Ticket_Description",     limit: 20
    t.string   "Plu_Number",                           limit: 5
    t.string   "Case_UPC_Supplier_Pack",               limit: 15
    t.integer  "Supplier_Pack_Qty",                    limit: 2
    t.float    "Supplier_Pack_Length",                 limit: 53
    t.float    "Supplier_Pack_Width",                  limit: 53
    t.float    "Supplier_Pack_Height",                 limit: 53
    t.float    "Supplier_Pack_Weight",                 limit: 53
    t.integer  "Supplier_Min_Order_Qty",               limit: 2
    t.string   "Warehouse_Pack_UPC_Number",            limit: 15
    t.float    "Whse_Pack_Qty",                        limit: 53
    t.float    "Whse_Pack_Length",                     limit: 53
    t.float    "Whse_Pack_Width",                      limit: 53
    t.float    "Whse_Pack_Height",                     limit: 53
    t.float    "Whse_Pack_Weight",                     limit: 53
    t.float    "Whse_Max_Order_Qty",                   limit: 53
    t.string   "Special_Handling_Instructions",        limit: 40
    t.string   "French_Special_Handling_Instructions", limit: 40
    t.integer  "Pallet_Ti"
    t.integer  "Pallet_Hi"
    t.integer  "Pallet_Round_Pct"
    t.integer  "Whse_Area",                            limit: 2
    t.integer  "Marshal_ID",                           limit: 2
    t.string   "Conveyable",                           limit: 1
    t.string   "Master_Carton_Ind",                    limit: 1
    t.integer  "Crush_Factor",                         limit: 2
    t.integer  "Whse_Rotation",                        limit: 2
    t.string   "Unit_Cost"
    t.float    "Base_Unit_Retail",                     limit: 53
    t.float    "Supplier_Pack_Cost",                   limit: 53
    t.float    "Mfgr_Pre_Price",                       limit: 53
    t.float    "Mfgr_Suggested_Retail",                limit: 53
    t.string   "Item_Opp",                             limit: 1
    t.string   "Whse_Pack_Calc_Method",                limit: 1
    t.integer  "Department",                           limit: 2
    t.string   "Supplier_Number",                      limit: 10
    t.string   "Item_Type",                            limit: 2
    t.string   "Sub_Type",                             limit: 2
    t.string   "Subclass",                             limit: 2
    t.string   "Fineline",                             limit: 4
    t.string   "Shelf_Number",                         limit: 7
    t.string   "Product_Number",                       limit: 7
    t.integer  "Projected_Yearly_Sales_Qty"
    t.datetime "Send_to_Store_Date"
    t.datetime "Item_Effective_Date"
    t.datetime "Item_Expiration_Date"
    t.string   "Performance_Rating",                   limit: 1
    t.string   "Corporate_Orderbook",                  limit: 1
    t.string   "eCommerce_Orderbook",                  limit: 1
    t.string   "Variety_Pack_Ind",                     limit: 1
    t.string   "Intangible_Ind",                       limit: 1
    t.string   "Country_of_Origin",                    limit: 10
    t.string   "Place_of_Manufacture",                 limit: 10
    t.string   "Factory_ID",                           limit: 10
    t.string   "Whse_Alignment",                       limit: 10
    t.string   "Warehouses_Stocked",                   limit: 10
    t.string   "Wal_Mart",                             limit: 1
    t.string   "Supercenter",                          limit: 1
    t.string   "Neighborhood_Market___Amigo",          limit: 1
    t.string   "Online",                               limit: 1
    t.string   "Send_Traits",                          limit: 10
    t.string   "Omit_Traits",                          limit: 10
    t.string   "Replaces_Item",                        limit: 10
    t.string   "Change_Reason_Code",                   limit: 10
    t.string   "Comment",                              limit: 120
    t.float    "Item_Length",                          limit: 53
    t.float    "Item_Width",                           limit: 53
    t.float    "Item_Height",                          limit: 53
    t.float    "Item_Weight",                          limit: 53
    t.string   "Guaranteed_Sales",                     limit: 1
    t.string   "Electronic_Article_Surveillance_Ind",  limit: 1
    t.string   "Temp_Sensitive_Ind",                   limit: 1
    t.string   "Shelf_Rotation",                       limit: 1
    t.string   "Modular_Batch_Print",                  limit: 1
    t.string   "Retail_Unit_Measurement",              limit: 10
    t.string   "Item_Scannable_Ind",                   limit: 1
    t.string   "Scalable_at_Register_Ind",             limit: 1
    t.string   "Backroom_Scale_Ind",                   limit: 1
    t.string   "Sold_by_Weight_Repl_by_Unit",          limit: 1
    t.float    "Shelf_Life_Days",                      limit: 53
    t.float    "Min_Whse_Life_Qty",                    limit: 53
    t.float    "Variance_Days",                        limit: 53
    t.float    "Ideal_Temp_Lo",                        limit: 53
    t.float    "Ideal_Temp_Hi",                        limit: 53
    t.float    "Acceptable_Temp_Lo",                   limit: 53
    t.float    "Acceptable_Temp_Hi",                   limit: 53
    t.float    "Vnpk_Netwgt",                          limit: 53
    t.string   "Acctg_Dept_Nbr",                       limit: 10
    t.string   "Supplier_Pack_Weight_Format",          limit: 1
    t.string   "Variable_Comp__Ind",                   limit: 1
    t.string   "Season_Code",                          limit: 10
    t.string   "Season_Year",                          limit: 4
    t.string   "Hazmat_Ind",                           limit: 1
    t.string   "Consideration_Code",                   limit: 10
    t.boolean  "ConfirmedToPOS"
  end

  create_table "label_itemfile", primary_key: "UPC_GTIN", force: true do |t|
    t.string   "UPC_CK_Digit",                         limit: 1
    t.string   "Supplier_Stock_Number",                limit: 15
    t.string   "Item_Description_1",                   limit: 20
    t.string   "French_Item_Description_1",            limit: 20
    t.string   "Shelf_1___Color",                      limit: 6
    t.string   "French_Shelf_1___Color",               limit: 6
    t.string   "Shelf_2___Size",                       limit: 6
    t.string   "French_Shelf_2___Size",                limit: 6
    t.string   "Unit_Size_UOM",                        limit: 10
    t.string   "Unit_Size_Sell_Qty",                   limit: 10
    t.string   "Item_Description_2",                   limit: 20
    t.string   "French_Item_Description_2",            limit: 20
    t.string   "UPC_Description",                      limit: 12
    t.string   "French_UPC_Description",               limit: 12
    t.string   "Signing_Desc",                         limit: 40
    t.string   "French_Signing_Desc",                  limit: 40
    t.string   "Brand",                                limit: 40
    t.string   "Shop___Ticket_Description",            limit: 20
    t.string   "French_Shop___Ticket_Description",     limit: 20
    t.string   "Plu_Number",                           limit: 5
    t.string   "Case_UPC_Supplier_Pack",               limit: 15
    t.integer  "Supplier_Pack_Qty",                    limit: 2
    t.float    "Supplier_Pack_Length",                 limit: 53
    t.float    "Supplier_Pack_Width",                  limit: 53
    t.float    "Supplier_Pack_Height",                 limit: 53
    t.float    "Supplier_Pack_Weight",                 limit: 53
    t.integer  "Supplier_Min_Order_Qty",               limit: 2
    t.string   "Warehouse_Pack_UPC_Number",            limit: 15
    t.float    "Whse_Pack_Qty",                        limit: 53
    t.float    "Whse_Pack_Length",                     limit: 53
    t.float    "Whse_Pack_Width",                      limit: 53
    t.float    "Whse_Pack_Height",                     limit: 53
    t.float    "Whse_Pack_Weight",                     limit: 53
    t.float    "Whse_Max_Order_Qty",                   limit: 53
    t.string   "Special_Handling_Instructions",        limit: 40
    t.string   "French_Special_Handling_Instructions", limit: 40
    t.integer  "Pallet_Ti"
    t.integer  "Pallet_Hi"
    t.integer  "Pallet_Round_Pct"
    t.integer  "Whse_Area",                            limit: 2
    t.integer  "Marshal_ID",                           limit: 2
    t.string   "Conveyable",                           limit: 1
    t.string   "Master_Carton_Ind",                    limit: 1
    t.integer  "Crush_Factor",                         limit: 2
    t.integer  "Whse_Rotation",                        limit: 2
    t.string   "Unit_Cost"
    t.float    "Base_Unit_Retail",                     limit: 53
    t.float    "Supplier_Pack_Cost",                   limit: 53
    t.float    "Mfgr_Pre_Price",                       limit: 53
    t.float    "Mfgr_Suggested_Retail",                limit: 53
    t.string   "Item_Opp",                             limit: 1
    t.string   "Whse_Pack_Calc_Method",                limit: 1
    t.integer  "Department",                           limit: 2
    t.string   "Supplier_Number",                      limit: 10
    t.string   "Item_Type",                            limit: 2
    t.string   "Sub_Type",                             limit: 2
    t.string   "Subclass",                             limit: 2
    t.string   "Fineline",                             limit: 4
    t.string   "Shelf_Number",                         limit: 7
    t.string   "Product_Number",                       limit: 7
    t.integer  "Projected_Yearly_Sales_Qty"
    t.datetime "Send_to_Store_Date"
    t.datetime "Item_Effective_Date"
    t.datetime "Item_Expiration_Date"
    t.string   "Performance_Rating",                   limit: 1
    t.string   "Corporate_Orderbook",                  limit: 1
    t.string   "eCommerce_Orderbook",                  limit: 1
    t.string   "Variety_Pack_Ind",                     limit: 1
    t.string   "Intangible_Ind",                       limit: 1
    t.string   "Country_of_Origin",                    limit: 10
    t.string   "Place_of_Manufacture",                 limit: 10
    t.string   "Factory_ID",                           limit: 10
    t.string   "Whse_Alignment",                       limit: 10
    t.string   "Warehouses_Stocked",                   limit: 10
    t.string   "Wal_Mart",                             limit: 1
    t.string   "Supercenter",                          limit: 1
    t.string   "Neighborhood_Market___Amigo",          limit: 1
    t.string   "Online",                               limit: 1
    t.string   "Send_Traits",                          limit: 10
    t.string   "Omit_Traits",                          limit: 10
    t.string   "Replaces_Item",                        limit: 10
    t.string   "Change_Reason_Code",                   limit: 10
    t.string   "Comment",                              limit: 120
    t.float    "Item_Length",                          limit: 53
    t.float    "Item_Width",                           limit: 53
    t.float    "Item_Height",                          limit: 53
    t.float    "Item_Weight",                          limit: 53
    t.string   "Guaranteed_Sales",                     limit: 1
    t.string   "Electronic_Article_Surveillance_Ind",  limit: 1
    t.string   "Temp_Sensitive_Ind",                   limit: 1
    t.string   "Shelf_Rotation",                       limit: 1
    t.string   "Modular_Batch_Print",                  limit: 1
    t.string   "Retail_Unit_Measurement",              limit: 10
    t.string   "Item_Scannable_Ind",                   limit: 1
    t.string   "Scalable_at_Register_Ind",             limit: 1
    t.string   "Backroom_Scale_Ind",                   limit: 1
    t.string   "Sold_by_Weight_Repl_by_Unit",          limit: 1
    t.float    "Shelf_Life_Days",                      limit: 53
    t.float    "Min_Whse_Life_Qty",                    limit: 53
    t.float    "Variance_Days",                        limit: 53
    t.float    "Ideal_Temp_Lo",                        limit: 53
    t.float    "Ideal_Temp_Hi",                        limit: 53
    t.float    "Acceptable_Temp_Lo",                   limit: 53
    t.float    "Acceptable_Temp_Hi",                   limit: 53
    t.float    "Vnpk_Netwgt",                          limit: 53
    t.string   "Acctg_Dept_Nbr",                       limit: 10
    t.string   "Supplier_Pack_Weight_Format",          limit: 1
    t.string   "Variable_Comp__Ind",                   limit: 1
    t.string   "Season_Code",                          limit: 10
    t.string   "Season_Year",                          limit: 4
    t.string   "Hazmat_Ind",                           limit: 1
    t.string   "Consideration_Code",                   limit: 10
    t.boolean  "ConfirmedToPOS"
    t.string   "Country_of_Origin_Name",               limit: 100
  end

  create_table "t_ProdList", id: false, force: true do |t|
    t.string "Product_ID", limit: 13, null: false
  end

  create_table "t_Temp1", id: false, force: true do |t|
    t.string   "UPC_GTIN",                             limit: 13,  null: false
    t.string   "UPC_CK_Digit",                         limit: 1
    t.string   "Supplier_Stock_Number",                limit: 15
    t.string   "Item_Description_1",                   limit: 20
    t.string   "French_Item_Description_1",            limit: 20
    t.string   "Shelf_1___Color",                      limit: 6
    t.string   "French_Shelf_1___Color",               limit: 6
    t.string   "Shelf_2___Size",                       limit: 6
    t.string   "French_Shelf_2___Size",                limit: 6
    t.string   "Unit_Size_UOM",                        limit: 10
    t.string   "Unit_Size_Sell_Qty",                   limit: 10
    t.string   "Item_Description_2",                   limit: 20
    t.string   "French_Item_Description_2",            limit: 20
    t.string   "UPC_Description",                      limit: 12
    t.string   "French_UPC_Description",               limit: 12
    t.string   "Signing_Desc",                         limit: 40
    t.string   "French_Signing_Desc",                  limit: 40
    t.string   "Brand",                                limit: 40
    t.string   "Shop___Ticket_Description",            limit: 20
    t.string   "French_Shop___Ticket_Description",     limit: 20
    t.string   "Plu_Number",                           limit: 5
    t.string   "Case_UPC_Supplier_Pack",               limit: 15
    t.integer  "Supplier_Pack_Qty",                    limit: 2
    t.float    "Supplier_Pack_Length",                 limit: 53
    t.float    "Supplier_Pack_Width",                  limit: 53
    t.float    "Supplier_Pack_Height",                 limit: 53
    t.float    "Supplier_Pack_Weight",                 limit: 53
    t.integer  "Supplier_Min_Order_Qty",               limit: 2
    t.string   "Warehouse_Pack_UPC_Number",            limit: 15
    t.float    "Whse_Pack_Qty",                        limit: 53
    t.float    "Whse_Pack_Length",                     limit: 53
    t.float    "Whse_Pack_Width",                      limit: 53
    t.float    "Whse_Pack_Height",                     limit: 53
    t.float    "Whse_Pack_Weight",                     limit: 53
    t.float    "Whse_Max_Order_Qty",                   limit: 53
    t.string   "Special_Handling_Instructions",        limit: 40
    t.string   "French_Special_Handling_Instructions", limit: 40
    t.integer  "Pallet_Ti"
    t.integer  "Pallet_Hi"
    t.integer  "Pallet_Round_Pct"
    t.integer  "Whse_Area",                            limit: 2
    t.integer  "Marshal_ID",                           limit: 2
    t.string   "Conveyable",                           limit: 1
    t.string   "Master_Carton_Ind",                    limit: 1
    t.integer  "Crush_Factor",                         limit: 2
    t.integer  "Whse_Rotation",                        limit: 2
    t.string   "Unit_Cost"
    t.float    "Base_Unit_Retail",                     limit: 53
    t.float    "Supplier_Pack_Cost",                   limit: 53
    t.float    "Mfgr_Pre_Price",                       limit: 53
    t.float    "Mfgr_Suggested_Retail",                limit: 53
    t.string   "Item_Opp",                             limit: 1
    t.string   "Whse_Pack_Calc_Method",                limit: 1
    t.integer  "Department",                           limit: 2
    t.string   "Supplier_Number",                      limit: 10
    t.string   "Item_Type",                            limit: 2
    t.string   "Sub_Type",                             limit: 2
    t.string   "Subclass",                             limit: 2
    t.string   "Fineline",                             limit: 4
    t.string   "Shelf_Number",                         limit: 7
    t.string   "Product_Number",                       limit: 7
    t.integer  "Projected_Yearly_Sales_Qty"
    t.datetime "Send_to_Store_Date"
    t.datetime "Item_Effective_Date"
    t.datetime "Item_Expiration_Date"
    t.string   "Performance_Rating",                   limit: 1
    t.string   "Corporate_Orderbook",                  limit: 1
    t.string   "eCommerce_Orderbook",                  limit: 1
    t.string   "Variety_Pack_Ind",                     limit: 1
    t.string   "Intangible_Ind",                       limit: 1
    t.string   "Country_of_Origin",                    limit: 10
    t.string   "Place_of_Manufacture",                 limit: 10
    t.string   "Factory_ID",                           limit: 10
    t.string   "Whse_Alignment",                       limit: 10
    t.string   "Warehouses_Stocked",                   limit: 10
    t.string   "Wal_Mart",                             limit: 1
    t.string   "Supercenter",                          limit: 1
    t.string   "Neighborhood_Market___Amigo",          limit: 1
    t.string   "Online",                               limit: 1
    t.string   "Send_Traits",                          limit: 10
    t.string   "Omit_Traits",                          limit: 10
    t.string   "Replaces_Item",                        limit: 10
    t.string   "Change_Reason_Code",                   limit: 10
    t.string   "Comment",                              limit: 120
    t.float    "Item_Length",                          limit: 53
    t.float    "Item_Width",                           limit: 53
    t.float    "Item_Height",                          limit: 53
    t.float    "Item_Weight",                          limit: 53
    t.string   "Guaranteed_Sales",                     limit: 1
    t.string   "Electronic_Article_Surveillance_Ind",  limit: 1
    t.string   "Temp_Sensitive_Ind",                   limit: 1
    t.string   "Shelf_Rotation",                       limit: 1
    t.string   "Modular_Batch_Print",                  limit: 1
    t.string   "Retail_Unit_Measurement",              limit: 10
    t.string   "Item_Scannable_Ind",                   limit: 1
    t.string   "Scalable_at_Register_Ind",             limit: 1
    t.string   "Backroom_Scale_Ind",                   limit: 1
    t.string   "Sold_by_Weight_Repl_by_Unit",          limit: 1
    t.float    "Shelf_Life_Days",                      limit: 53
    t.float    "Min_Whse_Life_Qty",                    limit: 53
    t.float    "Variance_Days",                        limit: 53
    t.float    "Ideal_Temp_Lo",                        limit: 53
    t.float    "Ideal_Temp_Hi",                        limit: 53
    t.float    "Acceptable_Temp_Lo",                   limit: 53
    t.float    "Acceptable_Temp_Hi",                   limit: 53
    t.float    "Vnpk_Netwgt",                          limit: 53
    t.string   "Acctg_Dept_Nbr",                       limit: 10
    t.string   "Supplier_Pack_Weight_Format",          limit: 1
    t.string   "Variable_Comp__Ind",                   limit: 1
    t.string   "Season_Code",                          limit: 10
    t.string   "Season_Year",                          limit: 4
    t.string   "Hazmat_Ind",                           limit: 1
    t.string   "Consideration_Code",                   limit: 10
    t.boolean  "ConfirmedToPOS"
    t.string   "Country_of_Origin_Name",               limit: 100
  end

end
