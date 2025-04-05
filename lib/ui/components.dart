import 'package:chillbot_dashboard/config.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    // return GlassContainer(
    //   height: 300,
    //   width: 400,
    //   gradient: LinearGradient(
    //     colors: [Colors.white.withOpacity(0.40), Colors.white.withOpacity(0.10)],
    //     begin: Alignment.topLeft,
    //     end: Alignment.bottomRight,
    //   ),
    //   borderGradient: LinearGradient(
    //     colors: [Colors.white.withOpacity(0.60), Colors.white.withOpacity(0.10), Colors.lightBlueAccent.withOpacity(0.05), Colors.lightBlueAccent.withOpacity(0.6)],
    //     begin: Alignment.topLeft,
    //     end: Alignment.bottomRight,
    //     stops: [0.0, 0.39, 0.40, 1.0],
    //   ),
    //   borderColor: Colors.white,
    //   blur: 15.0,
    //   borderWidth: 1.5,
    //   elevation: 3.0,
    //   isFrostedGlass: true,
    //   shadowColor: Colors.black.withOpacity(0.20),
    //   alignment: Alignment.center,
    //   frostedOpacity: 0.12,
    // );
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(32),
      ),
      child: child,
    );
  }
}

void showCustomDialog(
  BuildContext context,
  String title,
  String subtitle,
  String content,
) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: SizedBox(
          width: 500,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                    child: Text(title, style: context.textTheme.headlineLarge),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                    child: Text(
                      "Ingredients: \n$subtitle",
                      style: context.textTheme.labelLarge,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                    child: Text(
                      "Steps: \n$content",
                      style: context.textTheme.bodyMedium,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      );
    },
  );
}
