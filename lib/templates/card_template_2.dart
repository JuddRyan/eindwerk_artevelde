import 'package:flutter/material.dart';

class CardTemplate2 extends StatelessWidget {
  const CardTemplate2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Expanded(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(192, 123, 123, 123),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Hello World',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              // image: AssetImage("assets/images/placeholder.png"),
              image: NetworkImage(
                  "https://www.trainingbeta.com/wp-content/uploads/2016/01/hangboard1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

// old code
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
