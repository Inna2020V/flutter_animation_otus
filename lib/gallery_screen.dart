import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Happy Winnie'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SizedBox(
            height: 400,
            child: Hero(
              tag: 'winnie hero',
              child: FadeInImage(
                placeholder: AssetImage('images/placeholder.jpg'),
                image: NetworkImage(
                    'https://i.pinimg.com/originals/2b/0f/f9/2b0ff98a335a47d0fb62b8ff1f1c9d9e.gif'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
