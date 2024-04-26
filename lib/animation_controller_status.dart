import 'package:flutter/material.dart';

class AnimationControllerStatus extends StatefulWidget {
  const AnimationControllerStatus({super.key});

  @override
  State<AnimationControllerStatus> createState() =>
      _AnimationControllerStatusState();
}

class _AnimationControllerStatusState extends State<AnimationControllerStatus>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _animation = ColorTween(begin: Colors.red, end: Colors.blue).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut))
      ..addListener(() {
        print("animation Controller : ${_animationController.value}");
        setState(() {});
      })
      ..addStatusListener((status) {
        print("Animation Status changed : $status");
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            // SlideTransition(position: )
            Text(
              'Animation Controller value: ${_animationController.value.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Animation Value :${_animation.value}',
                style: TextStyle(fontSize: 20, color: _animation.value),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: 300,
              height: 300,
              color: _animation.value,
              alignment: Alignment.center,
              child: const Text(
                'Color Box animation',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      _animationController.forward();
                    },
                    child: const Icon(Icons.play_circle),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      _animationController.reverse();
                    },
                    child: Icon(Icons.arrow_back),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
