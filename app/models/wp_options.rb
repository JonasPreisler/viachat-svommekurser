class WpOptions < ActiveRecord::Base
  establish_connection(:production)
  self.table_name = "wp_options"

end