class Ingredient < ApplicationRecord
    #self.inheritance_column = 'my_type_column'
    validates :name, presence: true
    validates :my_type_column, presence: true
    validates :recipe, presence: true
    validates :instructions, presence: true
    validates :user_infos_id, presence: true

end
