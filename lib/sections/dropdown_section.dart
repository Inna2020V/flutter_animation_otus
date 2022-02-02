import 'package:flutter/material.dart';

class DropdownSection extends StatefulWidget {
  const DropdownSection({
    Key? key,
  }) : super(key: key);

  @override
  State<DropdownSection> createState() => _DropdownSectionState();
}

List<String> _items = ['Funny', 'Cute', 'Happy'];

class _DropdownSectionState extends State<DropdownSection>
    with SingleTickerProviderStateMixin {
  bool show = false;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.ease);

    _animation.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Winnie the Pooh',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                RotationTransition(
                  turns: Tween(begin: 0.0, end: 0.5).animate(_controller),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_downward),
                    onPressed: () {
                      if (show == false) {
                        _controller.forward();
                        show = true;
                      } else {
                        _controller.reverse();
                        show = false;
                      }
                    },
                  ),
                ),
              ],
            ),
            SizeTransition(
              sizeFactor: _animation,
              axis: Axis.vertical,
              axisAlignment: 1,
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                    itemCount: _items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(_items[index],
                            style: const TextStyle(fontSize: 16)),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
