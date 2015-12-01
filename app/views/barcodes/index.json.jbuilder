json.array!(@barcodes) do |barcode|
  json.extract! barcode, :id
  json.url barcode_url(barcode, format: :json)
end
