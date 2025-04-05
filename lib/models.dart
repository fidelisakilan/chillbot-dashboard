import 'package:cloud_firestore/cloud_firestore.dart';

class RecipeModel {
  final String label;
  final List<String> ingredients;

  RecipeModel({required this.label, required this.ingredients});

  factory RecipeModel.fromMap(Map<String, dynamic> map) {
    return RecipeModel(
      label: map["label"],
      ingredients: (map["ingredients"] as String).split(","),
    );
  }
}

class FridgeItemModel {
  final String label;
  final DateTime expDate;
  final DateTime mfgDate;

  FridgeItemModel({
    required this.label,
    required this.expDate,
    required this.mfgDate,
  });

  factory FridgeItemModel.fromMap(Map<String, dynamic> map) {
    return FridgeItemModel(
      label: map["label"],
      mfgDate: (map['mfg_date'] as Timestamp).toDate(),
      expDate: (map['exp_date'] as Timestamp).toDate(),
    );
  }
}
