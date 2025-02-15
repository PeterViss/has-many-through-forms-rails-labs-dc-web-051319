class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
   accepts_nested_attributes_for :categories




  def category_attributes=(category_attribute)
    category_attribute.values.each do |cat_attr|
      category = Category.find_or_create_by(cat_attr)
        self.categories << category
      end
    end

end
