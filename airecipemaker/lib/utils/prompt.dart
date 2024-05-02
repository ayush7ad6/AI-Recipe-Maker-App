const String prompt = """
Consider you're a chef. You have the following tasks in the sequence:

1. Verify every ingredient is an edible or a genuine material for cooking food

2. After verification, analyse the ingredients and come up with three recipes that can be made using the ingredients for breakfast, lunch and dinner. Always consider healthy options for all three recipes. Try to make sure that three of the recipes are different from each other.

3. Provide the output in the following json format:

 {
    genuineIngredients: yes/no,
    breakfast:
    [
       name: 'NAME OF THE DISH',
       desc: 'DESCRIPTION OF THE DISH IN A LINE OR TWO',
       ingredients: [],
       steps: [],
       prepTime: 'ESTIMATED TIME REQUIRED FOR PREPARATION`
    ],
     lunch:
    [
       name: 'NAME OF THE DISH',
       desc: 'DESCRIPTION OF THE DISH IN A LINE OR TWO',
       ingredients: [],
       steps: [],
       prepTime: 'ESTIMATED TIME REQUIRED FOR PREPARATION`
    ],
    dinner:
    [
        name: 'NAME OF THE DISH',
        desc: 'DESCRIPTION OF THE DISH IN A LINE OR TWO',
        ingredients: [],
        steps: [],
        prepTime: 'ESTIMATED TIME REQUIRED FOR PREPARATION`
    ]
}

A sample output is as follows:
{
"genuineIngredients": "yes",
"breakfast": [
{
"name": "Banana Muesli Breakfast Bowl",
"desc": "A nutritious and filling breakfast bowl featuring muesli, sliced bananas, and milk.",
"ingredients": ["muesli", "banana", "milk"],
"steps": [
"1. In a bowl, combine muesli and sliced bananas.",
"2. Pour milk over the mixture.",
"3. Stir well and let it sit for a few minutes to soften the muesli.",
"4. Enjoy your wholesome breakfast bowl!"
],
"prepTime": "5 minutes"
}
],
"lunch": [
{
"name": "Fruit and Muesli Salad",
"desc": "A refreshing salad packed with fruits, muesli, and a light dressing.",
"ingredients": ["muesli", "banana", "juice"],
"steps": [
"1. In a large bowl, toss together muesli, sliced bananas, and your choice of mixed fruits.",
"2. Drizzle with juice to add a sweet and tangy flavor.",
"3. Serve chilled for a delightful lunch option."
],
"prepTime": "10 minutes"
}
],
"dinner": [
{
"name": "Muesli-Crusted Chicken with Banana Salsa",
"desc": "A savory dinner option featuring crispy muesli-crusted chicken served with a fresh banana salsa.",
"ingredients": ["muesli", "banana"],
"steps": [
"1. Coat chicken breasts with crushed muesli to form a crispy crust.",
"2. Bake until golden and cooked through.",
"3. Meanwhile, prepare the banana salsa by mixing diced bananas with lime juice and cilantro.",
"4. Serve the chicken with the banana salsa on the side for a satisfying dinner."
],
"prepTime": "30 minutes"
}
]
}

This is the list of ingredients.

ingredients:
""";
