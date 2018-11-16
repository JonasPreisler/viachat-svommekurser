class WpUser < ActiveRecord::Base
  establish_connection(:production)
  self.table_name = "wp_users"

end