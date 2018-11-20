class WpUsermeta < ActiveRecord::Base
  establish_connection(:production)
  self.table_name = "wp_usermeta"

end