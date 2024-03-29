import 'package:flutter/material.dart';
import 'package:postmates/animations/FadeAnimation.dart';
import 'package:page_transition/page_transition.dart';

import './home_page.dart';

class StarterPage extends StatefulWidget {
  const StarterPage({Key key}) : super(key: key);

  @override
  _StarterPageState createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  bool _textVisible = true;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
    );

    _animation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTap() {
    setState(
      () {
        _textVisible = false;
      },
    );

    _animationController.forward().then(
          (value) => Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: HomePage(),
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/starter-image.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.6),
                  Colors.black.withOpacity(.2),
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FadeAnimation(
                    0.5,
                    Text(
                      'Taking Order For Faster Delivery',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                    1,
                    Text(
                      "See resturants nearby by \nadding location",
                      style: TextStyle(
                          color: Colors.white, height: 1.4, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  FadeAnimation(
                    (1.2),
                    ScaleTransition(
                      scale: _animation,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Colors.yellow,
                              Colors.orange,
                            ],
                          ),
                        ),
                        child: AnimatedOpacity(
                          opacity: _textVisible ? 1.0 : 0.0,
                          duration: Duration(
                            milliseconds: 50,
                          ),
                          child: MaterialButton(
                            onPressed: () => _onTap(),
                            minWidth: double.infinity,
                            child: Text(
                              'Start',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FadeAnimation(
                    1.4,
                    AnimatedOpacity(
                      opacity: _textVisible ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 50),
                      child: Align(
                        child: Text(
                          'Now Deliver To Your Door 24/7',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
