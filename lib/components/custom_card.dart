import 'package:eindwerk_lite/arguments.dart';
import 'package:flutter/material.dart';

class SimpleCard extends StatelessWidget {
  const SimpleCard({
    Key? key,
    @required this.title,
    @required this.image,
    @required this.description,
    this.route,
    this.onTap,
    this.margin,
  }) : super(key: key);

  final Function? onTap;
  final String? image, title, description;
  final String? route;
  final double? margin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //lower case in case of typo's
        if (route != null) {
          Navigator.pushNamed(
            context,
            route.toString().toLowerCase(),
            arguments: WorkoutArguments(
              title.toString(),
              description.toString(),
              image.toString(),
            ),
          );
        }
      },
      child: Container(
        margin: EdgeInsets.all((margin ?? 0)),
        child: Column(
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
                image: DecorationImage(
                  // image: AssetImage("assets/images/placeholder.png"),
                  image: NetworkImage(image.toString()),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    title.toString(),
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 16, height: 2),
                    maxLines: 1,
                  ),
                  Text(
                    description.toString(),
                    maxLines: 2,
                  )
                ],
              ),
            )
          ],
        ),
        // margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
