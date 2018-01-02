# Users
# ------------------------------------
oleg = User.create("Oleg")
josh = User.create("Josh")

# Drinks
# ------------------------------------
marg = Drink.create("Margarita", "image_url")
of = Drink.create("Old Fashioned", "image_url")
manhattan = Drink.create("Manhattan", "image_url")
vrb = Drink.create("Vodka Red Bull", "image_url")


# Ingredients
# ------------------------------------
teq = Ingredient.create("Tequilla")
ts = Ingredient.create("Triple Sec")
lij = Ingredient.create("Lime Juice")
ss = Ingredient.create("Simple Syrup")
rye = Ingredient.create("Rye Bourbon")
bitters = Ingredient.create("Aromatic Bitters")
sv = Ingredient.create("Sweet Vermouth")
vodka = Ingredient.create("Vodka")
rb = Ingredient.create("Red Bull")


# Categories
# ------------------------------------
classic = Category.create("Classic Cocktail")
modern = Category.create("Modern Cocktail")


# Associations
# ------------------------------------

## Drink-ingredients
marg.ingredients << teq
marg.ingredients << ts
marg.ingredients << lij
marg.ingredients << ss

of.ingredients << rye
of.ingredients << bitters
of.ingredients << ss

manhattan.ingredients << rye
manhattan.ingredients << bitters
manhattan.ingredients << sv

vrb.ingredients << vodka
vrb.ingredients << rb

## Categories
marg.categories << classic
of.categories << classic
manhattan.categories << classic
vrb.categories << modern

## User-drinks
josh.drinks << of
josh.drinks << marg

oleg.drinks << of
oleg.drinks << manhattan
oleg.drinks << vrb
