import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'models.dart';

class HomeBloc {
  final db = FirebaseFirestore.instance;
  StreamSubscription? _itemsSubscription;
  StreamSubscription? _recipeSubscription;

  StreamController<List<RecipeModel>> recipeController =
      StreamController.broadcast();
  StreamController<List<FridgeItemModel>> fridgeController =
      StreamController.broadcast();

  Stream<List<RecipeModel>> get recipeStream => recipeController.stream;

  Stream<List<FridgeItemModel>> get fridgeStream => fridgeController.stream;

  void init() {
    _itemsSubscription = db
        .collection("items")
        .snapshots()
        .listen((event) => _loadItems(event.docs));
    _recipeSubscription = db
        .collection("recipes")
        .snapshots()
        .listen((event) => _loadRecipes(event.docs));
  }

  void _loadItems(List<QueryDocumentSnapshot<Map<String, dynamic>>> snapshots) {
    final List<FridgeItemModel> items = [];
    for (var element in snapshots) {
      print("ITEMS: ${element.data()}");
      items.add(FridgeItemModel.fromMap(element.data()));
    }
    fridgeController.sink.add(items);
  }

  void _loadRecipes(
    List<QueryDocumentSnapshot<Map<String, dynamic>>> snapshots,
  ) {
    final List<RecipeModel> items = [];
    for (var element in snapshots) {
      print("RECIPES: ${element.data()}");
      items.add(RecipeModel.fromMap(element.data()));
    }
    recipeController.sink.add(items);
  }

  void dispose() {
    fridgeController.close();
    recipeController.close();
    _itemsSubscription?.cancel();
    _recipeSubscription?.cancel();
  }
}
