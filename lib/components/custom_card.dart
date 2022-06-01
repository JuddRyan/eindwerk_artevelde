import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    this.onTap,
    @required this.image,
    @required this.title,
    @required this.description,
  }) : super(key: key);

  final Function? onTap;
  final String? image, title, description;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap == null
            ? const Text('No Function passed')
            : const Text('Function passed');
      },
      child: Container(
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
