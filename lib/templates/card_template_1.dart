import 'package:flutter/material.dart';

class CardTemplate1 extends StatelessWidget {
  const CardTemplate1({
    Key? key,
    @required this.image,
    @required this.title,
    @required this.description,
  }) : super(key: key);

  final String? image;
  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
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
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, this.child, this.onTap}) : super(key: key);

  final Widget? child;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap == null
            ? const Text('No Function passed')
            : const Text('Function passed');
      },
      child: Container(
        child: child,
        // margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
