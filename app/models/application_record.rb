class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.policy_class
    "#{name}Policy".safe_constantize || ApplicationPolicy
  end
end
