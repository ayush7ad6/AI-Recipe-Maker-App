import 'package:airecipemaker/utils/prompt.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import 'package:flutter/widgets.dart';
import 'package:airecipemaker/constants.dart';
import 'package:airecipemaker/components/CustomTextField.dart';
import 'package:airecipemaker/components/CustomTextButton.dart';
import 'package:airecipemaker/utils/showSnackBar.dart';
import 'dart:convert';

class ReceipePage extends StatefulWidget {
  final String text;
  ReceipePage({Key? key, required this.text}) : super(key: key);

  @override
  State<ReceipePage> createState() => _ReceipePageState(this.text);
}

class _ReceipePageState extends State<ReceipePage> {
  final String text;
  _ReceipePageState(this.text);

  static const apiKey = "AIzaSyC5tl9CEtC8RnJcpo5EOHjtsHl1XMN8y6E";
  final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
  String _message = '';
  Map<String, dynamic> recipeMap = {};

  bool isLoading = true;

  Future<void> sendMessage() async {
    try {
      print('Fetching Recipes from Gemini');
      final message = text;
      // setState(() {
      //   _message = message;
      // });

      final content = [Content.text('$prompt $message')];
      final response = await model.generateContent(content);
      print('DUBEY:');
      setState(() {
        _message = response.text ?? "";
        print('RESPONSE: $_message');
        // recipeMap = jsonDecode(_message);
        // print(recipeMap['breakfast'][0]['name']);
        isLoading = false;
      });
    } catch (e) {
      print('ERROR: $e');
      showSnackBarDanger(context, 'An Error Occured');
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();
    // Call the fetch data method
    sendMessage();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading)
      return Scaffold(
          body: Center(child: Image(image: AssetImage('assets/loading2.gif'))));

    Map<String, dynamic> data = jsonDecode(_message);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: ListView(children: [
          MealCategory(
            title: 'Breakfast',
            recipes: List<Map<String, dynamic>>.from(data['breakfast']),
          ),
          MealCategory(
            title: 'Lunch',
            recipes: List<Map<String, dynamic>>.from(data['lunch']),
          ),
          MealCategory(
            title: 'Dinner',
            recipes: List<Map<String, dynamic>>.from(data['dinner']),
          ),
        ]),
      ),
    );
  }
}

class MealCategory extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> recipes;

  const MealCategory({
    super.key,
    required this.title,
    required this.recipes,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return RecipeCard(recipe: recipes[index]);
          },
        ),
      ],
    );
  }
}

class RecipeCard extends StatelessWidget {
  final Map<String, dynamic> recipe;

  const RecipeCard({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              recipe['name'],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              recipe['desc'],
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Ingredients: ${recipe['ingredients'].join(", ")}',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            const Text(
              'Steps:',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                recipe['steps'].length,
                (index) => Text(
                  '${index + 1}. ${recipe['steps'][index]}',
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Prep Time: ${recipe['prepTime']}',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
