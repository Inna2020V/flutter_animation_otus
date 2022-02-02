import 'package:flutter/material.dart';
import 'package:flutter_animation_otus/gallery_screen.dart';

class ContainerSection extends StatefulWidget {
  const ContainerSection({Key? key}) : super(key: key);

  @override
  State<ContainerSection> createState() => _ContainerSectionState();
}

class _ContainerSectionState extends State<ContainerSection> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Hero(
              tag: 'winnie hero',
              child: AnimatedContainer(
                height: 150,
                width: 150,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
                child: Image.network(
                    'https://i.pinimg.com/originals/2b/0f/f9/2b0ff98a335a47d0fb62b8ff1f1c9d9e.gif'),
              ),
            ),
            OutlinedButton(
              child: const Text('Show Happy Winnie',
                  style: TextStyle(fontSize: 16)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GalleryScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
