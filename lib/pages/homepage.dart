import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:circular_menu/circular_menu.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:yoga_app/pages/myprofile.dart';
import 'package:yoga_app/pages/notification.dart';
// import 'package:readmore/readmore.dart';
import 'package:yoga_app/pages/yoga%20class.dart';
import 'package:yoga_app/poses/child.dart';
import 'package:yoga_app/poses/plank.dart';
import 'package:yoga_app/poses/tree.dart';
import 'package:yoga_app/poses/triangle.dart';
import 'about us.dart';
import 'package:yoga_app/poses/cobra.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List cardList = [Item1(), Item2(), Item3(), Item4()];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => Stack(children: [
          Container(
            // constraints: BoxConstraints.expand(width: 500.0, height: 1200.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/slide/homepage4.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.deepPurple[200],
              elevation: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo1.png',
                    fit: BoxFit.contain,
                    height: 80,
                  ),
                ],
              ),
            ),
            body: CircularMenu(
              alignment: Alignment.bottomRight,
              toggleButtonColor: Colors.amber,
              items: [
                CircularMenuItem(
                    icon: Icons.perm_device_information,
                    color: Colors.indigoAccent,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => About()),
                      );
                    }),
                CircularMenuItem(
                    icon: Icons.event,
                    color: Colors.orange,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => YogaClass()),
                      );
                    }),
                CircularMenuItem(
                    icon: Icons.notification_important,
                    color: Colors.green,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Notifications()),
                      );
                    }),
                CircularMenuItem(
                    icon: Icons.account_box,
                    color: Colors.blue,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyProfile()),
                      );
                    }),
              ],
              backgroundWidget: Column(
                children: <Widget>[
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200.0,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      pauseAutoPlayOnTouch: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    items: cardList.map((card) {
                      return Builder(builder: (BuildContext context) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.30,
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            color: Colors.transparent,
                            child: card,
                          ),
                        );
                      });
                    }).toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: map<Widget>(cardList, (index, url) {
                      return Container(
                        width: 10.0,
                        height: 10.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? Colors.transparent
                              : Colors.grey,
                        ),
                      );
                    }),
                  ),
                  Expanded(
                    flex: 1,
                    child: new SingleChildScrollView(
                      scrollDirection: Axis.vertical, //.horizontal
                      child: Container(
                        // constraints:
                        //   BoxConstraints.expand(width: 900.0, height: 1800.0),
                        // decoration: BoxDecoration(
                        //     image: DecorationImage(
                        //         image: AssetImage("android/assets/homepage.jpg"),
                        //         fit: BoxFit.fitHeight)),
                        child: Column(
                          children: [
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: ReadMoreText(
                            //     'A set of specific exercises, called poses, combined with specific breathing techniques and meditation principles are the building blocks of a yoga class.If a pose causes pain or proves too difficult, there are variations and modifications that can be made to help students. Props like blocks, blankets and straps — even chairs — can be used to help you get the most benefit from the poses.',
                            //     trimLines: 2,
                            //     colorClickableText: Colors.deepPurple[200],
                            //     trimMode: TrimMode.Line,
                            //     trimCollapsedText: '...Show more',
                            //     style: TextStyle(
                            //       fontSize: 18.0,
                            //       color: Colors.white,
                            //       //fontWeight: FontWeight.bold,
                            //       fontFamily: 'Lato',
                            //     ),
                            //   ),
                            // ),
                            //  style:TextStyle(
                            //     fontSize: 25.0,
                            //     color: Colors.white,
                            //     //fontWeight: FontWeight.bold,
                            //     fontFamily: 'Lato',
                            //   ),

                            //   ),GestureDetector(
                            //   child: Text(
                            //     'more',
                            //     style: TextStyle(color: Colors.blue),
                            //   ),
                            //   onTap: () {
                            //     Text(
                            //         'If a pose causes pain or proves too difficult, there are variations and modifications that can be made to help students. Props like blocks, blankets and straps — even chairs — can be used to help you get the most benefit from the poses.');
                            //   },
                            // ),
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Child()),
                                );
                              },
                              child: Image.asset('assets/pose/child.png'),
                            ),
                            Text(
                              'CLASS 1',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                      // bottomLeft
                                      offset: Offset(-1.0, -1.0),
                                      color: Colors.black),
                                  Shadow(
                                      // bottomRight
                                      offset: Offset(-1.0, -1.0),
                                      color: Colors.black),
                                  Shadow(
                                      // topRight
                                      offset: Offset(-1.0, -1.0),
                                      color: Colors.black),
                                  Shadow(
                                      // topLeft
                                      offset: Offset(-1.0, -1.0),
                                      color: Colors.black),
                                ],
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: ReadMoreText(
                            //     'This calming pose is a good default pause position. You can use child’s pose to rest and refocus before continuing to your next pose. It gently stretches your lower back, hips, thighs, knees and ankles and relaxes your spine, shoulders and neck.',
                            //     trimLines: 2,
                            //     colorClickableText: Colors.deepPurple[200],
                            //     trimMode: TrimMode.Line,
                            //     trimCollapsedText: '...Show more',
                            //     style: TextStyle(
                            //       fontSize: 18.0,
                            //       color: Colors.white,
                            //       //fontWeight: FontWeight.bold,
                            //       fontFamily: 'Lato',
                            //     ),
                            //   ),
                            // ),
                            FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Plank()),
                                  );
                                },
                                child: Image.asset('assets/pose/plank.png')),
                            Text(
                              'CLASS 2',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                      // bottomLeft
                                      offset: Offset(-1.0, -1.0),
                                      color: Colors.black),
                                  Shadow(
                                      // bottomRight
                                      offset: Offset(-1.0, -1.0),
                                      color: Colors.black),
                                  Shadow(
                                      // topRight
                                      offset: Offset(-1.0, -1.0),
                                      color: Colors.black),
                                  Shadow(
                                      // topLeft
                                      offset: Offset(-1.0, -1.0),
                                      color: Colors.black),
                                ],
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: ReadMoreText(
                            //     'A commonly seen exercise, plank helps build strength in the core, shoulders, arms and legs.',
                            //     trimLines: 2,
                            //     colorClickableText: Colors.deepPurple[200],
                            //     trimMode: TrimMode.Line,
                            //     trimCollapsedText: '...Show more',
                            //     style: TextStyle(
                            //       fontSize: 18.0,
                            //       color: Colors.white,
                            //       // fontWeight: FontWeight.bold,
                            //       fontFamily: 'Lato',
                            //     ),
                            //   ),
                            // ),
                            FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Tree()),
                                  );
                                },
                                child: Image.asset('assets/pose/tree.png')),
                            Text(
                              'CLASS 3',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                      // bottomLeft
                                      offset: Offset(-1.0, -1.0),
                                      color: Colors.black),
                                  Shadow(
                                      // bottomRight
                                      offset: Offset(-1.0, -1.0),
                                      color: Colors.black),
                                  Shadow(
                                      // topRight
                                      offset: Offset(-1.0, -1.0),
                                      color: Colors.black),
                                  Shadow(
                                      // topLeft
                                      offset: Offset(-1.0, -1.0),
                                      color: Colors.black),
                                ],
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: ReadMoreText(
                            //     'Beyond helping improve your balance, it can also strengthen your core, ankles, calves, thighs and spine.',
                            //     trimLines: 2,
                            //     colorClickableText: Colors.deepPurple[200],
                            //     trimMode: TrimMode.Line,
                            //     trimCollapsedText: '...Show more',
                            //     style: TextStyle(
                            //       fontSize: 18.0,
                            //       color: Colors.white,
                            //       // fontWeight: FontWeight.bold,
                            //       fontFamily: 'Lato',
                            //     ),
                            //   ),
                            // ),
                            FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Cobra()),
                                  );
                                },
                                child: Image.asset('assets/pose/cobra.png')),
                            Text(
                              'CLASS 4',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                      // bottomLeft
                                      offset: Offset(-1.0, -1.0),
                                      color: Colors.black),
                                  Shadow(
                                      // bottomRight
                                      offset: Offset(-1.0, -1.0),
                                      color: Colors.black),
                                  Shadow(
                                      // topRight
                                      offset: Offset(-1.0, -1.0),
                                      color: Colors.black),
                                  Shadow(
                                      // topLeft
                                      offset: Offset(-1.0, -1.0),
                                      color: Colors.black),
                                ],
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: ReadMoreText(
                            //     'This back-bending pose can help strengthen the back muscles, increase spinal flexibility and stretches the chest, shoulders and abdomen.',
                            //     trimLines: 2,
                            //     colorClickableText: Colors.deepPurple[200],
                            //     trimMode: TrimMode.Line,
                            //     trimCollapsedText: '...Show more',
                            //     style: TextStyle(
                            //       fontSize: 18.0,
                            //       color: Colors.white,
                            //       //fontWeight: FontWeight.bold,
                            //       fontFamily: 'Lato',
                            //     ),
                            //   ),
                            // ),
                            FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Triangle()),
                                  );
                                },
                                child: Image.asset('assets/pose/triangle.png')),
                            Text(
                              'CLASS 5',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                      // bottomLeft
                                      offset: Offset(-1.0, -1.0),
                                      color: Colors.black),
                                  Shadow(
                                      // bottomRight
                                      offset: Offset(-1.0, -1.0),
                                      color: Colors.black),
                                  Shadow(
                                      // topRight
                                      offset: Offset(-1.0, -1.0),
                                      color: Colors.black),
                                  Shadow(
                                      // topLeft
                                      offset: Offset(-1.0, -1.0),
                                      color: Colors.black),
                                ],
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: ReadMoreText(
                            //     'Triangle, which is a part of many yoga sequences helps build strength in the legs and stretches the hips, spine, chest, shoulders, groins, hamstrings and calves. It can also help increase mobility in the hips and neck.',
                            //     trimLines: 2,
                            //     colorClickableText: Colors.deepPurple[200],
                            //     trimMode: TrimMode.Line,
                            //     trimCollapsedText: '...Show more',
                            //     style: TextStyle(
                            //       fontSize: 18.0,
                            //       color: Colors.white,
                            //       //fontWeight: FontWeight.bold,
                            //       fontFamily: 'Lato',
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class Item1 extends StatelessWidget {
  const Item1({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/slide/slide1.jpg');
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/slide/slide2.jpeg');
  }
}

class Item3 extends StatelessWidget {
  const Item3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/slide/slide3.jpg');
  }
}

class Item4 extends StatelessWidget {
  const Item4({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/slide/slide4.png');
  }
}
