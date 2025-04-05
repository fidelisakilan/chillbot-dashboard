import 'package:cloud_firestore/cloud_firestore.dart';

class RecipeModel {
  final String label;
  final List<String> ingredients;
  final String steps;
  final String? imageUrl;

  RecipeModel({
    required this.label,
    required this.ingredients,
    required this.steps,
    required this.imageUrl,
  });

  factory RecipeModel.fromMap(Map<String, dynamic> map) {
    return RecipeModel(
      label: map["recipe_name"],
      ingredients: (map["ingredients"] as String).split(","),
      steps: map["steps"],
      imageUrl: map["image_url"],
    );
  }
}

class FridgeItemModel {
  final String label;
  final DateTime expDate;

  FridgeItemModel({required this.label, required this.expDate});

  factory FridgeItemModel.fromMap(Map<String, dynamic> map) {
    return FridgeItemModel(
      label: map["label"],
      expDate: (map['exp_date'] as Timestamp).toDate(),
    );
  }
}
