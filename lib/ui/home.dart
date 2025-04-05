import 'package:chillbot_dashboard/config.dart';
import 'package:chillbot_dashboard/ui/components.dart';
import 'package:flutter/material.dart';

import '../home_bloc.dart';
import '../models.dart';
import 'mesh_bg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final bloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    bloc.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                SizedBox(width: 15),
                Expanded(
                  child: StreamBuilder<List<FridgeItemModel>>(
                    stream: bloc.fridgeStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return FridgeItemListWidget(fridge: snapshot.data!);
                      }
                      return Container();
                    },
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  flex: 2,
                  child: StreamBuilder<List<RecipeModel>>(
                    stream: bloc.recipeStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return RecipeListWidget(recipes: snapshot.data!);
                      }
                      return Container();
                    },
                  ),
                ),
                SizedBox(width: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FridgeItemListWidget extends StatelessWidget {
  const FridgeItemListWidget({super.key, required this.fridge});

  final List<FridgeItemModel> fridge;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'What I have in Fridge',
                style: context.textTheme.headlineLarge,
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 20),
                itemCount: fridge.length,
                itemBuilder: (context, index) {
                  final item = fridge.elementAt(index);
                  return GroceryItem(model: item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GroceryItem extends StatelessWidget {
  final FridgeItemModel model;

  const GroceryItem({super.key, required this.model});

  String dateStr(DateTime date) {
    int diff = date.difference(DateTime.now()).inDays;
    if (diff == 0) {
      return "Expiring Today";
    } else if (diff == 1) {
      return "$diff day Left";
    } else if (diff > 0) {
      return "$diff days Left";
    } else {
      return "Expired";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(500),
        color: context.colorScheme.secondaryContainer,
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            padding: EdgeInsets.all(20),
            height: 80,
            width: 80,
            child: Icon(Icons.local_grocery_store),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              model.label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(500),
            ),
            height: 80,
            width: 200,
            child: Center(
              child: Text(
                dateStr(model.expDate),
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RecipeListWidget extends StatelessWidget {
  const RecipeListWidget({super.key, required this.recipes});

  final List<RecipeModel> recipes;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Recommended Recipes',
                style: context.textTheme.headlineLarge,
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  final item = recipes.elementAt(index);
                  return RecipeItem(model: item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecipeItem extends StatelessWidget {
  final RecipeModel model;

  const RecipeItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: context.colorScheme.primaryContainer,
      ),
      child: Stack(
        children: [
          if (model.imageUrl != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                model.imageUrl!,
                fit: BoxFit.cover,
                width: 500,
                height: 500,
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.colorScheme.primary,
                    ),
                    padding: EdgeInsets.all(20),
                    child: Icon(Icons.restaurant, color: Colors.white),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      showCustomDialog(
                        context,
                        model.label,
                        model.ingredients.toString(),
                        model.steps,
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.colorScheme.primary,
                      ),
                      padding: EdgeInsets.all(20),
                      child: Icon(Icons.link, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: context.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.label,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      // Text(
                      //   model.ingredients.toString(),
                      //   style: const TextStyle(fontWeight: FontWeight.w400),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
