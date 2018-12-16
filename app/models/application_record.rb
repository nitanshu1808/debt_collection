class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  VALID_FILE_TYPE     = ["image/gif", "image/jpeg", "image/png"];
end
