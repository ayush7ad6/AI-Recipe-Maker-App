import 'dart:convert';

import 'package:airecipemaker/utils/prompt.dart';
import 'package:flutter/material.dart';
import 'package:airecipemaker/constants.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import 'package:airecipemaker/components/CustomTextField.dart';
import 'package:airecipemaker/components/CustomTextButton.dart';
import 'package:airecipemaker/screens/ReceipePage.dart';
import 'package:airecipemaker/utils/showSnackBar.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  TextEditingController ingredientController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/bg.jpeg'),
                  fit: BoxFit.cover,
                  opacity: 0.2)),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                'Enter Ingredients',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: kh4FontWeight,
                    fontSize: kh2size,
                    fontFamily: 'Montserrat'),
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CustomTextField(
                    controller: ingredientController, hintText: "Ingredients"),
              ),
              const SizedBox(height: 40.0),
              CustomTextButton(
                onTap: () {
                  if (ingredientController.text == '') {
                    showSnackBarDanger(context, 'Please enter ingredients');
                  } else {
                    showSnackBar(context, "Fetching Recipes...");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ReceipePage(text: ingredientController.text)));
                    ingredientController.text = '';
                  }
                },
                label: "Get Recipes",
                children: SizedBox.shrink(),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
