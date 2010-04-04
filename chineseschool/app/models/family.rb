class Family < ActiveRecord::Base
  
  belongs_to :address

  belongs_to :parent_one, :class_name => 'Person', :foreign_key => 'parent_one_id'
  belongs_to :parent_two, :class_name => 'Person', :foreign_key => 'parent_two_id'
  has_and_belongs_to_many :children, :class_name => 'Person', 
    :foreign_key => 'family_id', :association_foreign_key => 'child_id',
    :join_table => 'families_children'

  
  def children_names
    return "" if children.empty?
    children_names = ""
    children.each do |child|
      children_names << child.name
      children_names << ', '
    end
    children_names.chop.chop
  end
end
