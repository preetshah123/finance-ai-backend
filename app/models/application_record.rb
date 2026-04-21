class ApplicationRecord < ActiveRecord::Base
=begin
  this function is useful for storing similar DB functions for any DB calls
  if you extend this class to any db model, then that model will have these functions
  so its good to add for common things (like validation of values, clearing things)
=end
  primary_abstract_class
end
