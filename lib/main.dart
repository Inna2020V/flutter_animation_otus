import 'package:flutter/material.dart';
import 'package:flutter_animation_otus/sections/builder_section.dart';
import 'package:flutter_animation_otus/sections/container_section.dart';
import 'package:flutter_animation_otus/sections/dropdown_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Animations'),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: const [
                BuilderSection(),
                DropdownSection(),
                ContainerSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
