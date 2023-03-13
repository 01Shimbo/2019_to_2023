USE RecipesExample;
GO
CREATE VIEW v_ingredients_on_recipes 
AS
SELECT		RecipeTitle
			,IngredientName
FROM		Recipes rec
JOIN		Recipe_Ingredients rec_ing
ON			rec.RecipeId = rec_ing.RecipeId
JOIN		Ingredients ing
ON			ing.ingredientId = rec_ing.IngredientId;
GO

GRANT SELECT ON [dbo].[v_ingredients_on_recipes] TO [sonic]