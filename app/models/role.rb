class Role < ApplicationRecord
  has_and_belongs_to_many :users, :join_table => :users_roles
  
  belongs_to :resource,
             :polymorphic => true,
             :optional => true
  

  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true

  scopify

  def self.user_can_edit?(user, comment)
    user.has_role?(:admin) || comment.user_id == user.id
  end
  
  def self.user_can_destroy?(user, comment)
    user.has_role?(:admin) || comment.user_id == user.id
  end
  
end
