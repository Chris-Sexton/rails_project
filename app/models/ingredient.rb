class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  validates :name, presence: true

  ef quantity(recipe)
    q = RecipeIngredient.find_by(:recipe_id => recipe, :ingredient_id => self.id)
    return q.quantity
  end
  
end