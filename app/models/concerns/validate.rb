module Validate
  extend ActiveSupport::Concern
  module ClassMethods
    def validateData(data)
      puts "validate #{self.name}"
      logger.info "validate data"

      data['warnings'] = 0
      data['errors'] = 0

      #test run the import
      pkey = self.primary_key
      if (data['header'].values.include?(pkey)) then
        data['records'].each do |record|
          pvalue = nil
          record.each do |cell|
            if cell['name'] == pkey then
              pvalue = cell['value']
              break
            end
          end
          if pvalue == nil then
            data['records']['error'] = "primary key #{pkey} cannot be null"
          else
            record.each do |cell|
              next if cell['name'] == pkey
              attrs = {}
              attrs[pkey] = pvalue
              attrs[cell['name']] = cell['value']
              trial = self.init_instance

              begin
                trial.update(attrs)
                if cell['table'] == nil then
                  cell['table'] = self.name
                else
                  cell['message'] = {'level' => 'warning', 'text' => "#{cell['name']} is in both #{self.name} and #{cell['table']}"}
                  data['warnings'] = data['warnings'] + 1
                end
              rescue ActiveRecord::UnknownAttributeError => e
                cell['message'] = {'level' => 'warning', 'text' => e.message}
                data['warnings'] = data['warnings'] + 1
              rescue ActiveRecord::StatementInvalid => e
                if e.message =~ /TinyTds::Error: Cannot insert the value NULL into column '([^']*)', table '([^']*)';/ then
                  field_name = $1
                  table_name = $2
                  cell['message'] = {'level' => 'error', 'text' => "required field #{field_name} in table #{table_name} is missing"}
                  data['errors'] = data['errors'] + 1
                else
                  cell['message'] = {'level' => 'error', 'text' => e.message}
                  data['errors'] = data['errors'] + 1
                end
              rescue Exception => e
                cell['error'] = e.message
                data['error'] = "one or more attribute in one or more records cannot be imported"
              end
            end
          end
        end
      else
        data['error'] = "no primary key #{pkey} found"
      end

      return data
    end

    def loadData(data)
      puts "importing #{self.name}"
      logger.info "validate data"

      data['errors'] = []

      #test run the import
      pkey = self.primary_key
      if (data['header'].values.include?(pkey)) then
        data['records'].each do |record|
          attrs = {}
          pvalue = nil
          record.each do |cell|
            attrs[cell['name']] = cell['value']
            pvalue = cell['value'] if cell['name'] == self.primary_key
          end

          debugger

          trial = self.init_instance
          begin
            trial.update(attrs)
            trial.save
          rescue ActiveRecord::UnknownAttributeError => e
            data['errors'] << {'id' => pvalue, 'level' => 'warning', 'text' => e.message}
          rescue ActiveRecord::StatementInvalid => e
            if e.message =~ /TinyTds::Error: Cannot insert the value NULL into column '([^']*)', table '([^']*)';/ then
              field_name = $1
              table_name = $2
              data['errors'] << {'id' => pvalue, 'level' => 'error', 'text' => e.message}
              puts e.message
            else
              data['errors'] << {'id' => pvalue, 'level' => 'error', 'text' => e.message}
            end
          rescue Exception => e
            data['errors'] << {'id' => pvalue, 'level' => 'error', 'text' => e.message}
          end
        end
      else
        data['errors'] << {'level' => 'error', 'text' => "no primary #{pkey} found"}
      end

      return data
    end

  end
end
